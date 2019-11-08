defmodule ExDimensions.Ecto.UnitField do
  @moduledoc """
  A custom Ecto type for integration into Ecto based projects.
  The column is defined as a `:map` Ecto type with 2 keys:

  units: string representation of the units
  value: numerical value of the quantity

  For Postgres databases, that will map to a `jsonb` column.
  Other database implementations will vary.
  """
  @moduledoc since: "0.1.0"

  use Ecto.Type
  def type, do: :map

  def cast(%ExDimensions.Quantity{} = quantity), do: {:ok, quantity}

  def load(data) when is_map(data) do
    %{units: units, denom: denom} = parse(data[:units])
    %ExDimensions.Quantity{value: data[:value], units: units, denom: denom}
  end

  def dump(%ExDimensions.Quantity{value: v} = quantity) do
    %{value: v, units: to_string(quantity) |> String.split(" ") |> List.last()}
  end

  def parse(unit_str) do
    {:ok, parsed, "", _, _, _} = ExDimensions.Parser.units(unit_str)

    parsed
    |> ExDimensions.Parser.extract()
  end
end
