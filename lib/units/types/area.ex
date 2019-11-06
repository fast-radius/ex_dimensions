defmodule Units.Area do
  def square_inches(q),
    do: %Units.Quantity{value: q, units: [Unit.Spatial.Inches, Units.Spatial.Inches]}

  def square_feet(q),
    do: %Units.Quantity{value: q, units: [Units.Spatial.Feet, Units.Spatial.Feet]}

  def square_yards(q),
    do: %Units.Quantity{value: q, units: [Units.Spatial.Yards, Units.Spatial.Yards]}

  def square_miles(q),
    do: %Units.Quantity{value: q, units: [Units.Spatial.Miles, Units.Spatial.Miles]}

  def nm_squared(q),
    do: %Units.Quantity{value: q, units: [Units.Spatial.Nanometers, Units.Spatial.Nanometers]}

  def micros_squared(q),
    do: %Units.Quantity{value: q, units: [Units.Spatial.Micrometers, Units.Spatial.Micrometers]}

  def mm_squared(q),
    do: %Units.Quantity{value: q, units: [Units.Spatial.Millimeters, Units.Spatial.Millimeters]}

  def m_squared(q),
    do: %Units.Quantity{value: q, units: [Units.Spatial.Meters, Units.Spatial.Meters]}

  def km_squared(q),
    do: %Units.Quantity{value: q, units: [Units.Spatial.Kilometers, Units.Spatial.Kilometers]}
end
