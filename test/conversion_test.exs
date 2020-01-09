defmodule ExDimension.ConversionTest do
  use ExUnit.Case
  import ExDimensions.Conversions
  use ExDimensions.Math

  test "convert one simple unit to another" do
    u = ExDimensions.Spatial.inches(4)
    assert (u ~> ExDimensions.Spatial.Millimeters).value == 101.6
  end

  test "convert complex units to another" do
    u = ExDimensions.Area.square_inches(4)
    assert (u ~> (ExDimensions.Spatial.Millimeters ^^^ 2)).value == 2580.64
    u2 = ExDimensions.Volume.cubic_inches(4)
    assert (u2 ~> (ExDimensions.Spatial.Millimeters ^^^ 3)).value == 65548.4
  end
end
