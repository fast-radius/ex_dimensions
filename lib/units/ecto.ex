defmodule Units.Ecto.UnitField do
  use Ecto.Type
  def type, do: :map

  # Accept casting of URI structs as well
  def cast(%Units.Quantity{} = quantity), do: {:ok, quantity}

  def load(data) when is_map(data) do
    %{units: units, denom: denom} = parse(data[:units])
    %Units.Quantity{value: data[:value], units: units, denom: denom}
  end

  def dump(%Units.Quantity{value: v} = quantity) do
    %{value: v, units: to_string(quantity) |> String.split(" ") |> List.last()}
  end

  def parse(unit_str) do
    {:ok, parsed, "", _, _, _} = Units.Parser.units(unit_str)

    parsed
    |> Units.Parser.extract()
  end
end
