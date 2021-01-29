defmodule ExDimensions.Volume do
  @moduledoc """
  Base units for volume measurements in metric and imperial.
  """
  @moduledoc since: "0.1.0"

  def cubic_inches(q),
    do: %ExDimensions.Quantity{
      value: q,
      units: [
        ExDimensions.Spatial.Inches,
        ExDimensions.Spatial.Inches,
        ExDimensions.Spatial.Inches
      ]
    }

  def cubic_feet(q),
    do: %ExDimensions.Quantity{
      value: q,
      units: [ExDimensions.Spatial.Feet, ExDimensions.Spatial.Feet, ExDimensions.Spatial.Feet]
    }

  def mm_cubed(q),
    do: %ExDimensions.Quantity{
      value: q,
      units: [
        ExDimensions.Spatial.Millimeters,
        ExDimensions.Spatial.Millimeters,
        ExDimensions.Spatial.Millimeters
      ]
    }

  def cm_cubed(q),
    do: %ExDimensions.Quantity{
      value: q,
      units: [
        ExDimensions.Spatial.Centimeters,
        ExDimensions.Spatial.Centimeters,
        ExDimensions.Spatial.Centimeters
      ]
    }

  def m_cubed(q),
    do: %ExDimensions.Quantity{
      value: q,
      units: [
        ExDimensions.Spatial.Meters,
        ExDimensions.Spatial.Meters,
        ExDimensions.Spatial.Meters
      ]
    }
end
