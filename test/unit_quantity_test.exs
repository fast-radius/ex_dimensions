defmodule Units.QuantityTest do
  use ExUnit.Case
  use Units.Math

  test "to_string of a basic unit" do
    u = Units.Spatial.inches(6)
    assert to_string(u) == "6 in"
  end

  test "to_string of a rational unit" do
    u = Units.Spatial.inches(6)
    u2 = u / Units.Spatial.feet(10)
    assert to_string(u2) == "0.6 in/ft"
  end

  test "to_string of complex rational units" do
    u = Units.Spatial.inches(6) * Units.Spatial.inches(6)
    u2 = u / (Units.Spatial.feet(6) * Units.Spatial.feet(6))
    assert to_string(u2) == "1.0 in^2/ft^2"

    u = Units.Spatial.inches(36)
    u2 = u / (Units.Spatial.feet(6) * Units.Spatial.feet(6))
    assert to_string(u2) == "1.0 in^1/ft^2"
  end
end
