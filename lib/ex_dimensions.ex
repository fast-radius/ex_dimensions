defmodule ExDimensions do
  @moduledoc """
  `ex_dimensions` is a library for providing safe unit math and conversions.
  Units are tracked inside a struct that is labeled with phantom types for 
  the units of the number, and transparent math is provided by macros.  To get 
  started, first any simple numeric must be "lifted" into a unit aware number.
  The easiest way is using the helper functions for the type of quantity you want
  to work with:

      iex> q = ExDimensions.Spatial.inches(6)
      iex> IO.puts(q)
      "6 in"
      iex> IO.inspect(q)
      %ExDimensions.Quantity{value: 6, units: [ExDimensions.Spatial.Inches], denom: []}

  Quantities can be constructed manually but as they must obey certain rules, this
  is not recommended.

  Quantity arithmetic can be done transparently by using the `ExDimensions.Math` macros:

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

  Incorrect units supplied to math functions will result in `ArithmeticErrors`.

  There is also a unit conversion framework available.  See `ExDimensions.Conversions`
  for an example of how to use it.

  Finally, a custom Ecto type is provided for those who want to transparently persist
  numbers with units. See `ExDimensions.Ecto.UnitField` for an explanation. 
  """
end
