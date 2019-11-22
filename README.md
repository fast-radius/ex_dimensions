# ex_dimensions

Dimensional analysis and unit conversions for Elixir.

Quickstart:

```
iex> q = ExDimensions.Spatial.inches(6)
iex> IO.puts(q)
"6 in"
iex> IO.inspect(q)
%ExDimensions.Quantity{value: 6, units: [ExDimensions.Spatial.Inches], denom: []}
```

Dimensional analysis:

```
iex> defmodule Foo do 
iex>   use ExDimensions.Math
iex>   def do_some_math() do
iex>     q1 = ExDimensions.Spatial.inches(6)
iex>     q2 = ExDimensions.Spatial.inches(3)
iex>     q1 + q2
iex>   end
iex> end
iex> IO.puts(Foo.do_some_math())
"9 in"
```

Documentation can be found at [https://hexdocs.pm/ex_dimensions](https://hexdocs.pm/ex_dimensions).

## Installation

The package can be installed by adding `ex_dimensions` to your 
list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_dimensions, "~> 0.1.0"}
  ]
end
```
