defmodule ExDimensions.Unit do
  @moduledoc """
  Base behavior for a unit type.
  """
  @moduledoc since: "0.1.0"

  @callback abbr() :: [String.t()]
end

defmodule ExDimensions.Quantity do
  @moduledoc """
  The core quantity type for units.  It maintains bookkeeping around unit 
  manipulations as math and conversion operations are applied.  It is not 
  recommended to create this struct directly.  Rather, helpers such as 
  `ExDimensions.Spatial.inches(5)` should be used to initialize quantities, and
  manipulations of the value should take place using the macro defined in 
  `ExDimensions.UnitMath`.
  """
  @moduledoc since: "0.1.0"

  @enforce_keys [:value, :units]
  defstruct [:value, :units, denom: []]
end

defimpl Jason.Encoder, for: ExDimensions.Quantity do
  def encode(value, opts) do
    Jason.Encode.map(
      ExDimensions.Ecto.UnitField.dump(value) |> elem(1),
      opts
    )
  end
end

defimpl String.Chars, for: ExDimensions.Quantity do
  def to_string(%{value: v, units: [u], denom: []}) do
    "#{v} #{u.abbr}"
  end

  def to_string(%{value: v, units: [u], denom: [d]}) do
    "#{v} #{u.abbr}/#{d.abbr}"
  end

  def to_string(%{value: v, units: u, denom: d}) do
    # the group by gives a map with each key pointing to a list of length x
    # where x is how many occurrences of that key are in the original list
    numerator =
      Enum.group_by(u, fn k -> k end)
      |> Enum.reduce("", fn {k, v}, acc ->
        acc <> "#{k.abbr}^#{length(v)}"
      end)

    denominator =
      Enum.group_by(d, fn k -> k end)
      |> Enum.reduce("", fn {k, v}, acc ->
        acc <> "#{k.abbr}^#{length(v)}"
      end)

    "#{v} #{numerator}/#{denominator}"
  end
end
