# ----- IMPERIAL ---- #
defmodule ExDimensions.Spatial.Inches do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "in"
end

defmodule ExDimensions.Spatial.Feet do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "ft"
end

defmodule ExDimensions.Spatial.Yards do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "yd"
end

defmodule ExDimensions.Spatial.Miles do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "mi"
end

# ----- METRIC ---- #
defmodule ExDimensions.Spatial.Nanometers do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "nm"
end

defmodule ExDimensions.Spatial.Micrometers do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "um"
end

defmodule ExDimensions.Spatial.Millimeters do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "mm"
end

defmodule ExDimensions.Spatial.Meters do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "m"
end

defmodule ExDimensions.Spatial.Kilometers do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "km"
end

defmodule ExDimensions.Spatial do
  @moduledoc """
  Base units for spatial measurements in metric and imperial.  See
  `ExDimensions.Spatial.Area` and `ExDimensions.Spatial.Volume` for helpers that can create
  quantities in square and cubed units.
  """
  @moduledoc since: "0.1.0"

  def inches(q), do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Inches]}
  def feet(q), do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Feet]}
  def yards(q), do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Yards]}
  def miles(q), do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Miles]}

  def nanometers(q),
    do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Nanometers]}

  def micrometers(q),
    do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Micrometers]}

  def millimeters(q),
    do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Millimeters]}

  def meters(q), do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Meters]}

  def kilometers(q),
    do: %ExDimensions.Quantity{value: q, units: [ExDimensions.Spatial.Kilometers]}
end
