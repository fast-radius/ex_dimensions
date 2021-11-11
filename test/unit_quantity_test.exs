defmodule ExDimensions.QuantityTest do
  use ExUnit.Case, async: true
  use ExDimensions.Math

  test "to_string of a basic unit" do
    u = ExDimensions.Spatial.inches(6)
    assert to_string(u) == "6 in"
  end

  test "to_string of a rational unit" do
    u = ExDimensions.Spatial.inches(6)
    u2 = u / ExDimensions.Spatial.feet(10)
    assert to_string(u2) == "0.6 in/ft"
  end

  test "to_string of complex rational units" do
    u = ExDimensions.Spatial.inches(6) * ExDimensions.Spatial.inches(6)
    u2 = u / (ExDimensions.Spatial.feet(6) * ExDimensions.Spatial.feet(6))
    assert to_string(u2) == "1.0 in^2/ft^2"

    u = ExDimensions.Spatial.inches(36)
    u2 = u / (ExDimensions.Spatial.feet(6) * ExDimensions.Spatial.feet(6))
    assert to_string(u2) == "1.0 in^1/ft^2"
  end

  test "to JSON of a rational unit" do
    u = ExDimensions.Spatial.inches(6)
    u2 = u / ExDimensions.Spatial.feet(10)
    assert Jason.encode!(u2) == "{\"units\":\"in/ft\",\"value\":0.6}"
  end
end
