defmodule Units.Conversions.Temperature do
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
      {[Units.Temperature.Kelvin], [&Kernel.-/2, 273.15], [&Kernel.+/2, 273.15],
       [Units.Temperature.Celsius]},
      {[Units.Temperature.Fahrenheit], [&Units.Conversions.Temperature.fahrenheit_celsius/2, 32],
       [&Units.Conversions.Temperature.celsius_fahrenheit/2, 0.55555],
       [Units.Temperature.Celsius]}
    ]
end
