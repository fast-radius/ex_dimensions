defmodule Units.Conversions.Volume do
  @moduledoc false

  def mappings(),
    do: [
      # conversion functions are decomposed into lists so they can be stored in
      # a module attribute
      {[Units.Spatial.Inches, Units.Spatial.Inches, Units.Spatial.Inches], [&Kernel.//2, 0.00057870497511574],
       [&Kernel.*/2, 0.00057870497511574], [Units.Spatial.Feet, Units.Spatial.Feet, Units.Spatial.Feet]},
      {[Units.Spatial.Millimeters, Units.Spatial.Millimeters, Units.Spatial.Millimeters], [&Kernel.//2, 16387.1],
       [&Kernel.*/2, 16387.1], [Units.Spatial.Inches, Units.Spatial.Inches, Units.Spatial.Inches]},
      {[Units.Spatial.Millimeters, Units.Spatial.Millimeters, Units.Spatial.Millimeters], [&Kernel.//2, 1.0e+9],
       [&Kernel.*/2, 1.0e+9], [Units.Spatial.Meters, Units.Spatial.Meters, Units.Spatial.Meters]},
    ]
end
