defmodule Units.Parser.UnitTable do
  def from_abbr("nm"), do: Units.Spatial.Nanometers
  def from_abbr("μm"), do: Units.Spatial.Micrometers
  def from_abbr("mm"), do: Units.Spatial.Millimeters
  def from_abbr("m"), do: Units.Spatial.Meters
  def from_abbr("km"), do: Units.Spatial.Kilometers
  def from_abbr("in"), do: Units.Spatial.Inches
  def from_abbr("ft"), do: Units.Spatial.Feet
  def from_abbr("yd"), do: Units.Spatial.Yards
  def from_abbr("mi"), do: Units.Spatial.Miles
end

defmodule Units.Parser do 
  import NimbleParsec

  unit_str = 
    ascii_string([?a..?z], min: 1)
    |> optional(string("^"))
    |> optional(integer(min: 1))
    |> wrap()

  defparsec :units, 
    repeat(unit_str)
    |> wrap()
    |> optional(string("/"))
    |> wrap(repeat(unit_str))

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
    List.duplicate(Units.Parser.UnitTable.from_abbr(abbr), exp)
  end
  
  defp from_parse([abbr]) do
    Units.Parser.UnitTable.from_abbr(abbr)
  end
end
