defmodule ExDimensions.Temperature.Celsius do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "°C"
end

defmodule ExDimensions.Temperature.Kelvin do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "K"
end

defmodule ExDimensions.Temperature.Fahrenheit do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "°F"
end

defmodule ExDimensions.Temperature do
  @moduledoc """
  Base units for temperature measurements.
  """
  @moduledoc since: "0.1.0"

  def celsius(q), do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Temperature.Celsius]}
  def kelvin(q), do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Temperature.Kelvin]}
  def fahrenheit(q), do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Temperature.Fahrenheit]}
end
