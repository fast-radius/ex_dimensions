defmodule ExDimensions.Area do
  @moduledoc """
  Base units for area measurements in metric and imperial.
  """
  @moduledoc since: "0.1.0"

  def square_inches(q),
    do: %ExDimensions.Quantity{value: q, units: [Unit.Spatial.Inches, ExDimensions.Spatial.Inches]}

  def square_feet(q),
    do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Feet, ExDimensions.Spatial.Feet]}

  def square_yards(q),
    do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Yards, ExDimensions.Spatial.Yards]}

  def square_miles(q),
    do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Miles, ExDimensions.Spatial.Miles]}

  def nm_squared(q),
    do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Nanometers, ExDimensions.Spatial.Nanometers]}

  def micros_squared(q),
    do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Micrometers, ExDimensions.Spatial.Micrometers]}

  def mm_squared(q),
    do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Millimeters]}

  def m_squared(q),
    do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Meters, ExDimensions.Spatial.Meters]}

  def km_squared(q),
    do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Kilometers, ExDimensions.Spatial.Kilometers]}
end
