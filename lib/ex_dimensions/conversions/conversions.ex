defmodule ExDimensions.Conversions do
  @moduledoc """
  A module containing the DSL definitions for unit conversions
  """
  @moduledoc since: "0.1.0"

  require ExDimensions.Conversions.Graph
  @before_compile ExDimensions.Conversions.Graph

  alias ExDimensions.Quantity

  def %Quantity{value: v1, units: u, denom: []} ~> u2 when is_list(u2) do
    case convert(v1, u, u2) do
      {:ok, value} -> %Quantity{value: value, units: u2, denom: []}
      err -> err
    end
  end

  @doc """
  DSL function for converting a quantity of a given value to some 
  other unit, if there is an available conversion.  If so, 
  the new quantity is returned.  If not, then an error tuple
  is returned.  This module must be `import`ed into the current
  scope for this function to be available.

  ## Examples

      iex> import ExDimensions.Conversions
      iex> IO.puts(ExDimensions.Spatial.feet(1) ~> ExDimensions.Spatial.Inches)
      "12 in"
  """
  @doc since: "0.1.0"
  def %Quantity{value: v1, units: u, denom: []} ~> u2 do
    case convert(v1, u, [u2]) do
      {:ok, value} -> %Quantity{value: value, units: [u2], denom: []}
      err -> err
    end
  end
end
