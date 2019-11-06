defmodule Units.Conversions.Spatial do
  @moduledoc false

  def mappings(),
    do: [
      # conversion functions are decomposed into lists so they can be stored in
      # a module attribute
      {[Units.Spatial.Inches], [&Kernel.//2, 12], [&Kernel.*/2, 12], [Units.Spatial.Feet]},
      {[Units.Spatial.Feet], [&Kernel.//2, 3], [&Kernel.*/2, 3], [Units.Spatial.Yards]},
      {[Units.Spatial.Feet], [&Kernel.//2, 5280], [&Kernel.*/2, 5280], [Units.Spatial.Miles]},
      {[Units.Spatial.Millimeters], [&Kernel.//2, 25.4], [&Kernel.*/2, 25.4],
       [Units.Spatial.Inches]},
      {[Units.Spatial.Millimeters], [&Kernel.*/2, 1_000_000], [&Kernel.//2, 1_000_000],
       [Units.Spatial.Nanometers]},
      {[Units.Spatial.Millimeters], [&Kernel.*/2, 1000], [&Kernel.//2, 1000],
       [Units.Spatial.Micrometers]},
      {[Units.Spatial.Millimeters], [&Kernel.//2, 1000], [&Kernel.*/2, 1000],
       [Units.Spatial.Meters]},
      {[Units.Spatial.Meters], [&Kernel.//2, 1000], [&Kernel.*/2, 1000],
       [Units.Spatial.Kilometers]}
    ]
end
