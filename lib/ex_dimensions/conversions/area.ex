defmodule ExDimensions.Conversions.Area do
  @moduledoc false

  def mappings(),
    do: [
      # conversion functions are decomposed into lists so they can be stored in
      # a module attribute
      {[ExDimensions.Spatial.Inches, ExDimensions.Spatial.Inches], [&Kernel.//2, 0.00694],
       [&Kernel.*/2, 0.00694], [ExDimensions.Spatial.Feet, ExDimensions.Spatial.Feet]},
      {[ExDimensions.Spatial.Feet, ExDimensions.Spatial.Feet], [&Kernel.//2, 0.111],
       [&Kernel.*/2, 0.111], [ExDimensions.Spatial.Yards, ExDimensions.Spatial.Yards]},
      {[ExDimensions.Spatial.Feet, ExDimensions.Spatial.Feet], [&Kernel.//2, 3.587e-8],
       [&Kernel.*/2, 3.587e-8], [ExDimensions.Spatial.Miles, ExDimensions.Spatial.Miles]},
      {[ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Millimeters],
       [&Kernel.//2, 645.16], [&Kernel.*/2, 645.16],
       [ExDimensions.Spatial.Inches, ExDimensions.Spatial.Inches]},
      {[ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Millimeters],
       [&Kernel.*/2, 1.0e+12], [&Kernel.//2, 1.0e+12],
       [ExDimensions.Spatial.Nanometers, ExDimensions.Spatial.Nanometers]},
      {[ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Millimeters],
       [&Kernel.*/2, 1.0e+6], [&Kernel.//2, 1.0e+6],
       [ExDimensions.Spatial.Micrometers, ExDimensions.Spatial.Micrometers]},
      {[ExDimensions.Spatial.Millimeters, ExDimensions.Spatial.Millimeters],
       [&Kernel.//2, 1.0e+6], [&Kernel.*/2, 1.0e+6],
       [ExDimensions.Spatial.Meters, ExDimensions.Spatial.Meters]},
      {[ExDimensions.Spatial.Meters, ExDimensions.Spatial.Meters], [&Kernel.//2, 1.0e+6],
       [&Kernel.*/2, 1.0e+6], [ExDimensions.Spatial.Kilometers, ExDimensions.Spatial.Kilometers]}
    ]
end
