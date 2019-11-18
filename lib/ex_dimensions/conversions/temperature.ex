defmodule ExDimensions.Conversions.Temperature do
  @moduledoc false

  def celsius_fahrenheit(v, f) do
    v * 1.8 + f
  end

  def fahrenheit_celsius(v, f) do
    (v - 32) * f
  end

  def mappings(),
    do: [
      # conversion functions are decomposed into lists so they can be stored in
      # a module attribute
      {[ExDimensions.Temperature.Kelvin], [&Kernel.-/2, 273.15], [&Kernel.+/2, 273.15],
       [ExDimensions.Temperature.Celsius]},
      {[ExDimensions.Temperature.Fahrenheit],
       [&ExDimensions.Conversions.Temperature.fahrenheit_celsius/2, 32],
       [&ExDimensions.Conversions.Temperature.celsius_fahrenheit/2, 0.55555],
       [ExDimensions.Temperature.Celsius]}
    ]
end
