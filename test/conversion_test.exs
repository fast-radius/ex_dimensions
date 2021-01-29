defmodule ExDimension.ConversionTest do
  use ExDimensions.Math
  use ExUnit.Case

  import ExDimensions.Conversions

  alias ExDimensions.Quantity

  test "convert one simple unit to another" do
    inches = ExDimensions.Spatial.inches(4)
    mm = inches ~> ExDimensions.Spatial.Millimeters

    assert %Quantity{
             value: 101.6,
             units: [ExDimensions.Spatial.Millimeters]
           } = mm
  end

  test "convert complex units to another" do
    sq_in = ExDimensions.Area.square_inches(4)
    mm_sq = sq_in ~> (ExDimensions.Spatial.Millimeters ^^^ 2)

    assert %Quantity{
             value: 2580.64,
             units: [ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Millimeters]
           } = mm_sq

    cu_in = ExDimensions.Volume.cubic_inches(4)
    mm_cu = cu_in ~> (ExDimensions.Spatial.Millimeters ^^^ 3)

    assert %Quantity{
             value: 65548.4,
             units: [
               ExDimensions.Spatial.Millimeters,
               ExDimensions.Spatial.Millimeters,
               ExDimensions.Spatial.Millimeters
             ]
           } = mm_cu
  end

  test "convert mass units" do
    pounds = ExDimensions.Mass.pounds(4)
    kgs = pounds ~> ExDimensions.Mass.Kilograms

    assert %Quantity{
             value: 1.8140589569160996,
             units: [ExDimensions.Mass.Kilograms]
           } = kgs
  end
end
