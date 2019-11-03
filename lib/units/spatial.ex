# ----- IMPERIAL ---- #
defmodule Units.Spatial.Inches do
end

defmodule Units.Spatial.Feet do
end

defmodule Units.Spatial.Yards do
end

defmodule Units.Spatial.Miles do
end

# ----- METRIC ---- #
defmodule Units.Spatial.Nanometers do
end

defmodule Units.Spatial.Micrometers do
end

defmodule Units.Spatial.Millimeters do
end

defmodule Units.Spatial.Meters do
end

defmodule Units.Spatial.Kilometers do
end

defmodule Units.Spatial do
  def inches(q), do: %Units.Quantity{value: q, units: [Units.Spatial.Inches]}
  def feet(q), do: %Units.Quantity{value: q, units: [Units.Spatial.Feet]}
  def yards(q), do: %Units.Quantity{value: q, units: [Units.Spatial.Yards]}
  def miles(q), do: %Units.Quantity{value: q, units: [Units.Spatial.Miles]}
  def nanometers(q), do: %Units.Quantity{value: q, units: [Units.Spatial.Nanometers]}
  def micrometers(q), do: %Units.Quantity{value: q, units: [Units.Spatial.Micrometers]}
  def millimeters(q), do: %Units.Quantity{value: q, units: [Units.Spatial.Millimeters]}
  def meters(q), do: %Units.Quantity{value: q, units: [Units.Spatial.Meters]}
  def kilometers(q), do: %Units.Quantity{value: q, units: [Units.Spatial.Kilometers]}
end
