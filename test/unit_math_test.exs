defmodule ExDimensions.MathTest do
  use ExUnit.Case, async: false
  use ExCheck
  use ExDimensions.Math

  test "exponent notation for conversion DSL" do
    assert ExDimensions.Spatial.Inches ^^^ 3 == [
             ExDimensions.Spatial.Inches,
             ExDimensions.Spatial.Inches,
             ExDimensions.Spatial.Inches
           ]
  end

  property :addition_preserves_units do
    for_all {x, y, u} in {int(), int(),
             oneof([ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Inches])} do
      %ExDimensions.Quantity{value: x, units: [u]} + %ExDimensions.Quantity{value: y, units: [u]} ==
        %ExDimensions.Quantity{denom: [], units: [u], value: x + y}
    end
  end

  property :addition_of_different_units_not_allowed do
    for_all {x, u1, u2} in {int(), oneof([ExDimensions.Spatial.Millimeters]),
             oneof([ExDimensions.Spatial.Inches])} do
      try do
        %ExDimensions.Quantity{value: x, units: u1} + %ExDimensions.Quantity{value: x, units: u2}
        false
      rescue
        ArithmeticError -> true
      end
    end
  end

  property :subtraction_preserves_units do
    for_all {x, y, u} in {int(), int(),
             oneof([ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Inches])} do
      %ExDimensions.Quantity{value: x, units: [u]} - %ExDimensions.Quantity{value: y, units: [u]} ==
        %ExDimensions.Quantity{denom: [], units: [u], value: x - y}
    end
  end

  property :subtraction_of_different_units_not_allowed do
    for_all {x, u1, u2} in {int(), oneof([ExDimensions.Spatial.Millimeters]),
             oneof([ExDimensions.Spatial.Inches])} do
      try do
        %ExDimensions.Quantity{value: x, units: u1} - %ExDimensions.Quantity{value: x, units: u2}
        false
      rescue
        ArithmeticError -> true
      end
    end
  end

  property :scalar_multiplication_preserves_units do
    for_all {x, y, u} in {int(), int(),
             oneof([ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Inches])} do
      %ExDimensions.Quantity{value: x, units: [u]} * y == %ExDimensions.Quantity{
        value: x * y,
        units: [u]
      }
    end
  end

  property :multiplication_of_different_units_includes_both_units do
    for_all {x, y, u1, u2} in {int(), int(),
             oneof([ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Micrometers]),
             oneof([ExDimensions.Spatial.Inches, ExDimensions.Spatial.Feet])} do
      q =
        %ExDimensions.Quantity{value: x, units: [u1]} *
          %ExDimensions.Quantity{value: y, units: [u2]}

      q == %ExDimensions.Quantity{value: x * y, units: [u1, u2] |> Enum.sort()}
    end
  end

  property :multiplication_raises_unit_power do
    for_all {x, y, exp, u} in {int(), int(), int(),
             oneof([ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Inches])} do
      implies exp > 0 do
        %ExDimensions.Quantity{value: x, units: List.duplicate(u, exp)} *
          %ExDimensions.Quantity{value: y, units: List.duplicate(u, exp)} ==
          %ExDimensions.Quantity{
            denom: [],
            units: List.duplicate(u, exp * 2),
            value: x * y
          }
      end
    end
  end

  property :multiplcation_adds_unit_exponents do
    for_all {x, y, x_num_exp, x_denom_exp, y_num_exp, y_denom_exp, u1, u2} in {int(), int(),
             int(), int(), int(), int(),
             oneof([ExDimensions.Mass.Grams, ExDimensions.Mass.Pounds]),
             oneof([ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Inches])} do
      implies x_num_exp >= 0 do
        implies x_denom_exp >= 0 do
          implies y_num_exp >= 0 do
            implies y_denom_exp >= 0 do
              x_quant = %ExDimensions.Quantity{
                value: x,
                units: List.duplicate(u1, x_num_exp),
                denom: List.duplicate(u2, x_denom_exp)
              }

              y_quant = %ExDimensions.Quantity{
                value: y,
                units: List.duplicate(u2, y_num_exp),
                denom: List.duplicate(u1, y_denom_exp)
              }

              expected = %ExDimensions.Quantity{
                # Numerator includes units from x and y numerators that weren't cancelled out by denominator units.
                units:
                  (List.duplicate(u1, max(0, x_num_exp - y_denom_exp)) ++
                     List.duplicate(u2, max(0, y_num_exp - x_denom_exp)))
                  |> Enum.sort(),
                # Denominator includes units from x and y denominators that weren't cancelled out by numerator units.
                denom:
                  (List.duplicate(u2, max(0, x_denom_exp - y_num_exp)) ++
                     List.duplicate(u1, max(0, y_denom_exp - x_num_exp)))
                  |> Enum.sort(),
                value: x * y
              }

              x_quant * y_quant == expected
            end
          end
        end
      end
    end
  end

  property :scalar_division_preserves_units do
    for_all {x, y, u} in {int(), int(),
             oneof([ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Inches])} do
      implies y > 0 do
        %ExDimensions.Quantity{value: x, units: [u]} / y == %ExDimensions.Quantity{
          value: x / y,
          units: [u]
        }
      end
    end
  end

  property :division_completely_cancels_units_when_they_are_the_same do
    for_all {x, y, exp, u} in {int(), int(), int(),
             oneof([ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Inches])} do
      implies y > 0 do
        implies exp > 0 do
          %ExDimensions.Quantity{value: x, units: List.duplicate(u, exp)} /
            %ExDimensions.Quantity{value: y, units: List.duplicate(u, exp)} == x / y
        end
      end
    end
  end

  test "division partially cancels units where appropriate" do
    q1 = %ExDimensions.Quantity{
      value: 6,
      units: [ExDimensions.Spatial.Inches, ExDimensions.Temperature.Kelvin]
    }

    q2 = %ExDimensions.Quantity{value: 3, units: [ExDimensions.Temperature.Kelvin]}

    assert q1 / q2 == %ExDimensions.Quantity{
             value: 2.0,
             units: [ExDimensions.Spatial.Inches],
             denom: []
           }
  end

  property :comparison_is_correct do
    for_all {x, y, u} in {int(), int(),
             oneof([ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Inches])} do
      %ExDimensions.Quantity{value: x, units: [u]} < %ExDimensions.Quantity{value: y, units: [u]} ==
        x < y

      %ExDimensions.Quantity{value: x, units: [u]} <= %ExDimensions.Quantity{value: y, units: [u]} ==
        x <= y

      %ExDimensions.Quantity{value: x, units: [u]} > %ExDimensions.Quantity{value: y, units: [u]} ==
        x > y

      %ExDimensions.Quantity{value: x, units: [u]} >= %ExDimensions.Quantity{value: y, units: [u]} ==
        x >= y

      %ExDimensions.Quantity{value: x, units: [u]} == %ExDimensions.Quantity{value: y, units: [u]} ==
        (x == y)
    end
  end
end
