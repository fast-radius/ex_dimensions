# ----- IMPERIAL ---- #
defmodule Units.Spatial.Inches do
  @behaviour Units.Unit

  def abbr, do: "in"
end

defmodule Units.Spatial.Feet do
  @behaviour Units.Unit

  def abbr, do: "ft"
end

defmodule Units.Spatial.Yards do
  @behaviour Units.Unit

  def abbr, do: "yd"
end

defmodule Units.Spatial.Miles do
  @behaviour Units.Unit

  def abbr, do: "mi"
end

# ----- METRIC ---- #
defmodule Units.Spatial.Nanometers do
  @behaviour Units.Unit

  def abbr, do: "nm"
end

defmodule Units.Spatial.Micrometers do
  @behaviour Units.Unit

  def abbr, do: "μm"
end

defmodule Units.Spatial.Millimeters do
  @behaviour Units.Unit

  def abbr, do: "mm"
end

defmodule Units.Spatial.Meters do
  @behaviour Units.Unit

  def abbr, do: "m"
end

defmodule Units.Spatial.Kilometers do
  @behaviour Units.Unit

  def abbr, do: "km"
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
