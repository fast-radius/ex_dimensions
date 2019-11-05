defmodule Units.Volume do
  @moduledoc """
  Base units for volume measurements in metric and imperial.
  """
  @moduledoc since: "0.1.0"

  def cubic_inches(q),
    do: %Units.Quantity{value: q, units: [Units.Spatial.Inches, Units.Spatial.Inches]}

  def cubic_feet(q),
    do: %Units.Quantity{
      value: q,
      units: [Units.Spatial.Feet, Units.Spatial.Feet, Units.Spatial.Feet]
    }

  def cubic_yards(q),
    do: %Units.Quantity{
      value: q,
      units: [Units.Spatial.Yards, Units.Spatial.Yards, Units.Spatial.Yards]
    }

  def cubic_miles(q),
    do: %Units.Quantity{
      value: q,
      units: [Units.Spatial.Miles, Units.Spatial.Miles, Units.Spatial.Miles]
    }

  def nm_cubed(q),
    do: %Units.Quantity{
      value: q,
      units: [Units.Spatial.Nanometers, Units.Spatial.Nanometers, Units.Spatial.Nanometers]
    }

  def micros_cubed(q),
    do: %Units.Quantity{
      value: q,
      units: [Units.Spatial.Micrometers, Units.Spatial.Micrometers, Units.Spatial.Micrometers]
    }

  def mm_cubed(q),
    do: %Units.Quantity{
      value: q,
      units: [Units.Spatial.Millimeters, Units.Spatial.Millimeters, Units.Spatial.Millimeters]
    }

  def m_cubed(q),
    do: %Units.Quantity{
      value: q,
      units: [Units.Spatial.Meters, Units.Spatial.Meters, Units.Spatial.Meters]
    }

  def km_cubed(q),
    do: %Units.Quantity{
      value: q,
      units: [Units.Spatial.Kilometers, Units.Spatial.Kilometers, Units.Spatial.Kilometers]
    }
end
