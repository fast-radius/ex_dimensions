defmodule Units.Temperature.Celsius do
  @moduledoc false

  @behaviour Units.Unit

  def abbr, do: "°C"
end

defmodule Units.Temperature.Kelvin do
  @moduledoc false

  @behaviour Units.Unit

  def abbr, do: "K"
end

defmodule Units.Temperature.Fahrenheit do
  @moduledoc false

  @behaviour Units.Unit

  def abbr, do: "°F"
end

defmodule Units.Temperature do
  @moduledoc """
  Base units for temperature measurements.
  """
  @moduledoc since: "0.1.0"

  def celsius(q), do: %Units.Quantity{value: q, units: [Units.Temperature.Celsius]}
  def kelvin(q), do: %Units.Quantity{value: q, units: [Units.Temperature.Kelvin]}
  def fahrenheit(q), do: %Units.Quantity{value: q, units: [Units.Temperature.Fahrenheit]}
end
