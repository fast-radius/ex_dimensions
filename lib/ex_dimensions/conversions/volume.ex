defmodule ExDimensions.Conversions.Volume do
  @moduledoc false

  def mappings(),
    do: [
      # conversion functions are decomposed into lists so they can be stored in
      # a module attribute
      {[ExDimensions.Spatial.Inches, ExDimensions.Spatial.Inches, ExDimensions.Spatial.Inches],
       [&Kernel.//2, 0.00057870497511574], [&Kernel.*/2, 0.00057870497511574],
       [ExDimensions.Spatial.Feet, ExDimensions.Spatial.Feet, ExDimensions.Spatial.Feet]},
      {[
         ExDimensions.Spatial.Millimeters,
         ExDimensions.Spatial.Millimeters,
         ExDimensions.Spatial.Millimeters
       ], [&Kernel.//2, 16387.1], [&Kernel.*/2, 16387.1],
       [ExDimensions.Spatial.Inches, ExDimensions.Spatial.Inches, ExDimensions.Spatial.Inches]},
      {[
         ExDimensions.Spatial.Millimeters,
         ExDimensions.Spatial.Millimeters,
         ExDimensions.Spatial.Millimeters
       ], [&Kernel.//2, 1.0e+9], [&Kernel.*/2, 1.0e+9],
       [ExDimensions.Spatial.Meters, ExDimensions.Spatial.Meters, ExDimensions.Spatial.Meters]}
    ]
end
