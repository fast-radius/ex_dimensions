defmodule Units.Conversions.Area do
  @moduledoc false

  def mappings(),
    do: [
      # conversion functions are decomposed into lists so they can be stored in
      # a module attribute
      {[Units.Spatial.Inches, Units.Spatial.Inches], [&Kernel.//2, 0.00694],
       [&Kernel.*/2, 0.00694], [Units.Spatial.Feet, Units.Spatial.Feet]},
      {[Units.Spatial.Feet, Units.Spatial.Feet], [&Kernel.//2, 0.111], [&Kernel.*/2, 0.111],
       [Units.Spatial.Yards, Units.Spatial.Yards]},
      {[Units.Spatial.Feet, Units.Spatial.Feet], [&Kernel.//2, 3.587e-8], [&Kernel.*/2, 3.587e-8],
       [Units.Spatial.Miles, Units.Spatial.Miles]},
      {[Units.Spatial.Millimeters, Units.Spatial.Millimeters], [&Kernel.//2, 645.16],
       [&Kernel.*/2, 645.16], [Units.Spatial.Inches, Units.Spatial.Inches]},
      {[Units.Spatial.Millimeters, Units.Spatial.Millimeters], [&Kernel.*/2, 1.0e+12],
       [&Kernel.//2, 1.0e+12], [Units.Spatial.Nanometers, Units.Spatial.Nanometers]},
      {[Units.Spatial.Millimeters, Units.Spatial.Millimeters], [&Kernel.*/2, 1.0e+6],
       [&Kernel.//2, 1.0e+6], [Units.Spatial.Micrometers, Units.Spatial.Micrometers]},
      {[Units.Spatial.Millimeters, Units.Spatial.Millimeters], [&Kernel.//2, 1.0e+6],
       [&Kernel.*/2, 1.0e+6], [Units.Spatial.Meters, Units.Spatial.Meters]},
      {[Units.Spatial.Meters, Units.Spatial.Meters], [&Kernel.//2, 1.0e+6], [&Kernel.*/2, 1.0e+6],
       [Units.Spatial.Kilometers, Units.Spatial.Kilometers]}
    ]
end
