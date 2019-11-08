defmodule Units.Volume do
  @moduledoc """
  Base units for volume measurements in metric and imperial.
  """
  @moduledoc since: "0.1.0"

  def cubic_inches(q),
    do: %Units.Quantity{value: q, units: [Units.Spatial.Inches, Units.Spatial.Inches, Units.Spatial.Inches]}

  def cubic_feet(q),
    do: %Units.Quantity{
      value: q,
      units: [Units.Spatial.Feet, Units.Spatial.Feet, Units.Spatial.Feet]
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
end
