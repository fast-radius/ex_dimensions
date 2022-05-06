defmodule ExDimensions.Parser.UnitTable do
  @moduledoc false

  def from_abbr("nm"), do: ExDimensions.Spatial.Nanometers
  def from_abbr("um"), do: ExDimensions.Spatial.Micrometers
  def from_abbr("mm"), do: ExDimensions.Spatial.Millimeters
  def from_abbr("m"), do: ExDimensions.Spatial.Meters
  def from_abbr("km"), do: ExDimensions.Spatial.Kilometers
  def from_abbr("in"), do: ExDimensions.Spatial.Inches
  def from_abbr("ft"), do: ExDimensions.Spatial.Feet
  def from_abbr("yd"), do: ExDimensions.Spatial.Yards
  def from_abbr("mi"), do: ExDimensions.Spatial.Miles
end

defmodule ExDimensions.Parser do
  @moduledoc false

  import NimbleParsec

  # this defines a parser for which the following input is valid
  # ft^1 <- a simple unit
  # ft^2 <- a compound unit
  # ft^1/s^1 <- a rational unit
  # ft^2/s^2 <- a rational unit made of compound units
  #
  # the ^1 is required despite it being redundant because the
  # exponent notation is treated as a delimiter
  #
  # the combinators collectively declare that 0..n units
  # followed by an optional "/" for rational units, followed
  # by 0..n units in the denominator is valid
  unit_str =
    ascii_string([?a..?z], min: 1)
    |> optional(string("^"))
    |> optional(integer(min: 1))
    |> wrap()

  defparsec(
    :units,
    repeat(unit_str)
    |> wrap()
    |> optional(string("/"))
    |> wrap(repeat(unit_str))
  )

  def extract([numerator, "/", denominator]) do
    units = Enum.flat_map(numerator, &from_parse/1)
    denom = Enum.flat_map(denominator, &from_parse/1)
    %{units: units, denom: denom}
  end

  def extract([numerator, []]) do
    units = Enum.map(numerator, &from_parse/1)
    %{units: units, denom: []}
  end

  defp from_parse([abbr, _, exp]) do
    List.duplicate(ExDimensions.Parser.UnitTable.from_abbr(abbr), exp)
  end

  defp from_parse([abbr]) do
    ExDimensions.Parser.UnitTable.from_abbr(abbr)
  end
end
