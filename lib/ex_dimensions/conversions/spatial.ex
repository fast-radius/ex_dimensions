defmodule ExDimensions.Conversions.Spatial do
  @moduledoc false

  def mappings(),
    do: [
      # conversion functions are decomposed into lists so they can be stored in
      # a module attribute
      {[ExDimensions.Spatial.Inches], [&Kernel.//2, 12], [&Kernel.*/2, 12], [ExDimensions.Spatial.Feet]},
      {[ExDimensions.Spatial.Feet], [&Kernel.//2, 3], [&Kernel.*/2, 3], [ExDimensions.Spatial.Yards]},
      {[ExDimensions.Spatial.Feet], [&Kernel.//2, 5280], [&Kernel.*/2, 5280], [ExDimensions.Spatial.Miles]},
      {[ExDimensions.Spatial.Millimeters], [&Kernel.//2, 25.4], [&Kernel.*/2, 25.4],
       [ExDimensions.Spatial.Inches]},
      {[ExDimensions.Spatial.Millimeters], [&Kernel.*/2, 1_000_000], [&Kernel.//2, 1_000_000],
       [ExDimensions.Spatial.Nanometers]},
      {[ExDimensions.Spatial.Millimeters], [&Kernel.*/2, 1000], [&Kernel.//2, 1000],
       [ExDimensions.Spatial.Micrometers]},
      {[ExDimensions.Spatial.Millimeters], [&Kernel.//2, 1000], [&Kernel.*/2, 1000],
       [ExDimensions.Spatial.Meters]},
      {[ExDimensions.Spatial.Meters], [&Kernel.//2, 1000], [&Kernel.*/2, 1000],
       [ExDimensions.Spatial.Kilometers]}
    ]
end
