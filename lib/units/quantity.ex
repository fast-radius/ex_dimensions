defmodule Units.Quantity do
  @enforce_keys [:value, :units]
  defstruct [:value, :units, denom: []]
end
