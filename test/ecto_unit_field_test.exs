defmodule ExDimensions.EctoUnitFieldTest do
  use ExUnit.Case, async: true

  test "deserialization of a basic unit" do
    {:ok, quantity} = ExDimensions.Ecto.UnitField.load(%{"value" => 43, "units" => "ft"})

    assert quantity == %ExDimensions.Quantity{
             value: 43,
             units: [ExDimensions.Spatial.Feet],
             denom: []
           }
  end

  test "deserialization of a complex unit" do
    {:ok, quantity} =
      ExDimensions.Ecto.UnitField.load(%{"value" => 43, "units" => "ft^2/m^2in^3"})

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

  test "deserialization of all units" do
    units = [
      ExDimensions.Spatial.Nanometers,
      ExDimensions.Spatial.Micrometers,
      ExDimensions.Spatial.Millimeters,
      ExDimensions.Spatial.Meters,
      ExDimensions.Spatial.Kilometers,
      ExDimensions.Spatial.Inches,
      ExDimensions.Spatial.Feet,
      ExDimensions.Spatial.Yards,
      ExDimensions.Spatial.Miles
    ]

    units |> Enum.each(fn(unit) -> assert_deserialization(unit) end)
  end

  defp assert_deserialization(unit) do
    {:ok, quantity} =
      ExDimensions.Ecto.UnitField.load(%{
        "value" => 28,
        "units" => "#{unit.abbr()}^1"
      })

    assert quantity == %ExDimensions.Quantity{
      denom: [],
      units: [
        [unit],
      ],
      value: 28
    }
  end

end
