defmodule ExDimensions.MathTest do
  use ExUnit.Case, async: true
  use ExUnitProperties
  use ExDimensions.Math

  @metric_lengths [ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Micrometers]
  @imperial_lengths [ExDimensions.Spatial.Inches, ExDimensions.Spatial.Feet]
  @length_units @metric_lengths ++ @imperial_lengths
  @mass_units [
    ExDimensions.Mass.Ounces,
    ExDimensions.Mass.Pounds,
    ExDimensions.Mass.Grams,
    ExDimensions.Mass.Kilograms
  ]
  @temperature_units [
    ExDimensions.Temperature.Kelvin,
    ExDimensions.Temperature.Celsius,
    ExDimensions.Temperature.Fahrenheit
  ]

  test "exponent notation for conversion DSL" do
    assert pow(ExDimensions.Spatial.Inches, 3) == [
             ExDimensions.Spatial.Inches,
             ExDimensions.Spatial.Inches,
             ExDimensions.Spatial.Inches
           ]
  end

  property "addition_preserves_units" do
    check all x <- integer(),
              y <- integer(),
              u <- one_of(@length_units) do
      %ExDimensions.Quantity{value: x, units: [u]} + %ExDimensions.Quantity{value: y, units: [u]} ==
        %ExDimensions.Quantity{denom: [], units: [u], value: x + y}
    end
  end

  property "addition_of_different_units_not_allowed" do
    check all x <- integer(),
              u1 <- one_of(@length_units),
              u2 <- one_of(@length_units),
              u1 != u2 do
      assert_raise ArithmeticError, fn ->
        %ExDimensions.Quantity{value: x, units: u1} + %ExDimensions.Quantity{value: x, units: u2}
      end
    end
  end

  property "subtraction_preserves_units" do
    check all x <- integer(),
              y <- integer(),
              u <- one_of(@length_units) do
      %ExDimensions.Quantity{value: x, units: [u]} - %ExDimensions.Quantity{value: y, units: [u]} ==
        %ExDimensions.Quantity{denom: [], units: [u], value: x - y}
    end
  end

  property "subtraction_of_different_units_not_allowed" do
    check all x <- integer(),
              u1 <- one_of(@length_units),
              u2 <- one_of(@length_units),
              u1 != u2 do
      assert_raise ArithmeticError, fn ->
        %ExDimensions.Quantity{value: x, units: u1} - %ExDimensions.Quantity{value: x, units: u2}
      end
    end
  end

  property "scalar_multiplication_preserves_units" do
    check all x <- integer(),
              y <- integer(),
              u <- one_of(@length_units) do
      %ExDimensions.Quantity{value: x, units: [u]} * y == %ExDimensions.Quantity{
        value: x * y,
        units: [u]
      }
    end
  end

  property "multiplication_of_different_units_includes_both_units" do
    check all x <- integer(),
              y <- integer(),
              u1 <- one_of(@metric_lengths),
              u2 <- one_of(@imperial_lengths) do
      q =
        %ExDimensions.Quantity{value: x, units: [u1]} *
          %ExDimensions.Quantity{value: y, units: [u2]}

      q == %ExDimensions.Quantity{value: x * y, units: [u1, u2]}
    end
  end

  property "multiplication_raises_unit_power" do
    check all x <- integer(),
              y <- integer(),
              exp <- positive_integer(),
              u <- one_of(@length_units) do
      %ExDimensions.Quantity{value: x, units: List.duplicate(u, exp)} *
        %ExDimensions.Quantity{value: y, units: List.duplicate(u, exp)} ==
        %ExDimensions.Quantity{
          denom: [],
          units: List.duplicate(u, exp * 2),
          value: x * y
        }
    end
  end

  property "scalar_division_preserves_units" do
    check all x <- integer(),
              y <- positive_integer(),
              u <- one_of(@length_units) do
      %ExDimensions.Quantity{value: x, units: [u]} / y == %ExDimensions.Quantity{
        value: x / y,
        units: [u]
      }
    end
  end

  property "division_completely_cancels_units_when_they_are_the_same" do
    check all x <- integer(),
              y <- positive_integer(),
              exp <- positive_integer(),
              u <- one_of(@length_units) do
      %ExDimensions.Quantity{value: x, units: List.duplicate(u, exp)} /
        %ExDimensions.Quantity{value: y, units: List.duplicate(u, exp)} == x / y
    end
  end

  property "division partially cancels units where appropriate" do
    check all x <- integer(),
              y <- integer(),
              y != 0,
              u1 <- one_of(@length_units),
              u2 <- one_of([one_of(@temperature_units), one_of(@mass_units)]),
              u1 != u2 do
      q1 = %ExDimensions.Quantity{value: x, units: [u1, u2]}
      q2 = %ExDimensions.Quantity{value: y, units: [u2]}

      assert q1 / q2 == %ExDimensions.Quantity{
               value: x / y,
               units: [u1],
               denom: []
             }
    end
  end

  property "comparison_is_correct" do
    check all x <- integer(),
              y <- integer(),
              u <- one_of(@length_units) do
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
