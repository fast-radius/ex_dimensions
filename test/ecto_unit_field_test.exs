defmodule Units.EctoUnitFieldTest do
  use ExUnit.Case

  test "deserialization of a basic unit" do
    quantity = Units.Ecto.UnitField.load(%{value: 43, units: "ft"})
    assert quantity == %Units.Quantity{value: 43, units: [Units.Spatial.Feet], denom: []}
  end
  
  test "deserialization of a complex unit" do
    quantity = Units.Ecto.UnitField.load(%{value: 43, units: "ft^2/m^2in^3"})
    assert quantity == %Units.Quantity{
      denom: [Units.Spatial.Meters, Units.Spatial.Meters, Units.Spatial.Inches,
        Units.Spatial.Inches, Units.Spatial.Inches],
      units: [Units.Spatial.Feet, Units.Spatial.Feet],
      value: 43
    }
  end
end
