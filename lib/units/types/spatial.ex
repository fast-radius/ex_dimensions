# ----- IMPERIAL ---- #
defmodule Units.Spatial.Inches do
  @moduledoc false

  @behaviour Units.Unit

  def abbr, do: "in"
end

defmodule Units.Spatial.Feet do
  @moduledoc false

  @behaviour Units.Unit

  def abbr, do: "ft"
end

defmodule Units.Spatial.Yards do
  @moduledoc false

  @behaviour Units.Unit

  def abbr, do: "yd"
end

defmodule Units.Spatial.Miles do
  @moduledoc false

  @behaviour Units.Unit

  def abbr, do: "mi"
end

# ----- METRIC ---- #
defmodule Units.Spatial.Nanometers do
  @moduledoc false

  @behaviour Units.Unit

  def abbr, do: "nm"
end

defmodule Units.Spatial.Micrometers do
  @moduledoc false

  @behaviour Units.Unit

  def abbr, do: "μm"
end

defmodule Units.Spatial.Millimeters do
  @moduledoc false

  @behaviour Units.Unit

  def abbr, do: "mm"
end

defmodule Units.Spatial.Meters do
  @moduledoc false

  @behaviour Units.Unit

  def abbr, do: "m"
end

defmodule Units.Spatial.Kilometers do
  @moduledoc false

  @behaviour Units.Unit

  def abbr, do: "km"
end

defmodule Units.Spatial do
  @moduledoc """
  Base units for spatial measurements in metric and imperial.  See
  `Units.Spatial.Area` and `Units.Spatial.Volume` for helpers that can create
  quantities in square and cubed units.
  """
  @moduledoc since: "0.1.0"

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
