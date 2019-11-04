defmodule Units.Unit do
  @callback abbr() :: [String.t]
end

defmodule Units.Quantity do
  @enforce_keys [:value, :units]
  defstruct [:value, :units, denom: []]
end

defimpl String.Chars, for: Units.Quantity do
  def to_string(%{value: v, units: [u], denom: []}) do
    "#{v} #{u.abbr}" 
  end
  
  def to_string(%{value: v, units: [u], denom: [d]}) do
    "#{v} #{u.abbr}/#{d.abbr}" 
  end
  
  def to_string(%{value: v, units: u, denom: d}) do
    # the group by gives a map with each key pointing to a list of length x
    # where x is how many occurrences of that key are in the original list
    numerator = Enum.group_by(u, fn k -> k end)
    |> Enum.reduce("", fn({k, v}, acc) ->
      acc <> "#{k.abbr}^#{length(v)}"
    end) 

    denominator = Enum.group_by(d, fn k -> k end)
    |> Enum.reduce("", fn({k, v}, acc) ->
      acc <> "#{k.abbr}^#{length(v)}"
    end) 

    "#{v} #{numerator}/#{denominator}" 
  end
end
