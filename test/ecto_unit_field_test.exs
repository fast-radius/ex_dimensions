defmodule ExDimensions.EctoUnitFieldTest do
  use ExUnit.Case

  test "deserialization of a basic unit" do
    {:ok, quantity} = ExDimensions.Ecto.UnitField.load(%{"value" => 43, "units" => "ft"})

    assert quantity == %ExDimensions.Quantity{
             value: 43,
             units: [ExDimensions.Spatial.Feet],
             denom: []
           }
  end

  test "deserialization of a complex unit" do
    {:ok, quantity} = ExDimensions.Ecto.UnitField.load(%{"value" => 43, "units" => "ft^2/m^2in^3"})

    assert quantity == %ExDimensions.Quantity{
             denom: [
               ExDimensions.Spatial.Meters,
               ExDimensions.Spatial.Meters,
               ExDimensions.Spatial.Inches,
               ExDimensions.Spatial.Inches,
               ExDimensions.Spatial.Inches
             ],
             units: [ExDimensions.Spatial.Feet, ExDimensions.Spatial.Feet],
             value: 43
           }
  end
end
