defmodule Units.Conversions do
  @moduledoc """
  A module containing the DSL definitions for unit conversions
  """
  @moduledoc since: "0.1.0"

  require Units.ConversionGraph
  @before_compile Units.ConversionGraph

  def %{value: v1, units: u, denom: []} ~> u2 when is_list(u2) do
    {:ok, value} = convert(v1, u, u2)
    %{value: value, units: u2, denom: []}
  end

  @doc """
  DSL function for converting a quantity of a given value to some 
  other unit, if there is an available conversion.  If so, 
  the new quantity is returned.  If not, then an error tuple
  is returned.  This module must be `import`ed into the current
  scope for this function to be available.

  ## Examples

      iex> import Units.Conversions
      iex> IO.puts(Units.Spatial.feet(1) ~> Units.Spatial.Inches)
      "12 in"
  """
  @doc since: "0.1.0"
  def %{value: v1, units: u, denom: []} ~> u2 do
    case convert(v1, u, [u2]) do
      {:ok, value} -> %{value: value, units: [u2], denom: []}
      err -> err
    end
  end
end
