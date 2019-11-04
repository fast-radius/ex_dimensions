defmodule Units.MathTest do
  use ExUnit.Case, async: false
  use ExCheck
  use Units.Math

  property :addition_preserves_units do
    for_all {x, y, u} in {int(), int(), oneof([Units.Spatial.Millimeters, Units.Spatial.Inches])} do
      %Units.Quantity{value: x, units: [u]} + %Units.Quantity{value: y, units: [u]} ==
        %Units.Quantity{denom: [], units: [u], value: x + y}
    end
  end

  property :addition_of_different_units_not_allowed do
    for_all {x, u1, u2} in {int(), oneof([Units.Spatial.Millimeters]),
             oneof([Units.Spatial.Inches])} do
      try do
        %Units.Quantity{value: x, units: u1} + %Units.Quantity{value: x, units: u2}
        false
      rescue
        ArithmeticError -> true
      end
    end
  end

  property :subtraction_preserves_units do
    for_all {x, y, u} in {int(), int(), oneof([Units.Spatial.Millimeters, Units.Spatial.Inches])} do
      %Units.Quantity{value: x, units: [u]} - %Units.Quantity{value: y, units: [u]} ==
        %Units.Quantity{denom: [], units: [u], value: x - y}
    end
  end

  property :subtraction_of_different_units_not_allowed do
    for_all {x, u1, u2} in {int(), oneof([Units.Spatial.Millimeters]),
             oneof([Units.Spatial.Inches])} do
      try do
        %Units.Quantity{value: x, units: u1} - %Units.Quantity{value: x, units: u2}
        false
      rescue
        ArithmeticError -> true
      end
    end
  end

  property :scalar_multiplication_preserves_units do
    for_all {x, y, u} in {int(), int(), oneof([Units.Spatial.Millimeters, Units.Spatial.Inches])} do
      %Units.Quantity{value: x, units: [u]} * y == %Units.Quantity{value: x * y, units: [u]}
    end
  end

  property :multiplication_of_different_units_includes_both_units do
    for_all {x, y, u1, u2} in {int(), int(),
             oneof([Units.Spatial.Millimeters, Units.Spatial.Micrometers]),
             oneof([Units.Spatial.Inches, Units.Spatial.Feet])} do
    
      q = %Units.Quantity{value: x, units: [u1]} * %Units.Quantity{value: y, units: [u2]}
      q == %Units.Quantity{value: x * y, units: [u1, u2]}
    end
  end

  property :multiplication_raises_unit_power do
    for_all {x, y, exp, u} in {int(), int(), int(),
             oneof([Units.Spatial.Millimeters, Units.Spatial.Inches])} do
      implies exp > 0 do
        %Units.Quantity{value: x, units: List.duplicate(u, exp)} *
          %Units.Quantity{value: y, units: List.duplicate(u, exp)} == %Units.Quantity{
          denom: [],
          units: List.duplicate(u, exp * 2),
          value: x * y
        }
      end
    end
  end

  property :scalar_division_preserves_units do
    for_all {x, y, u} in {int(), int(), oneof([Units.Spatial.Millimeters, Units.Spatial.Inches])} do
      implies y > 0 do
        %Units.Quantity{value: x, units: [u]} / y == %Units.Quantity{value: x / y, units: [u]}
      end
    end
  end

  property :division_cancels_units_when_they_are_the_same do
    for_all {x, y, exp, u} in {int(), int(), int(),
             oneof([Units.Spatial.Millimeters, Units.Spatial.Inches])} do
      implies y > 0 do
        implies exp > 0 do
          %Units.Quantity{value: x, units: List.duplicate(u, exp)} /
            %Units.Quantity{value: y, units: List.duplicate(u, exp)} == x / y
        end
      end
    end
  end
end
