defmodule ExDimensions.Conversions.Mass do
  @moduledoc false

  def mappings(),
    do: [
      # conversion functions are decomposed into lists so they can be stored in
      # a module attribute
      {[ExDimensions.Mass.Ounces], [&Kernel.//2, 16.0],
       [&Kernel.*/2, 16.0], [ExDimensions.Mass.Pounds]},
      {[ExDimensions.Mass.Pounds], [&Kernel.//2, 2.205],
       [&Kernel.*/2, 2.205], [ExDimensions.Mass.Kilograms]},
      {[ExDimensions.Mass.Grams], [&Kernel.//2, 1000.0],
       [&Kernel.*/2, 1000.0], [ExDimensions.Mass.Kilograms]},
    ]
end
