# ----- IMPERIAL ---- #
defmodule ExDimensions.Mass.Ounces do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "oz"
end

defmodule ExDimensions.Mass.Pounds do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "lb"
end

defmodule ExDimensions.Mass.Grams do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "g"
end

defmodule ExDimensions.Mass.Kilograms do
  @moduledoc false

  @behaviour ExDimensions.Unit

  def abbr, do: "kg"
end

defmodule ExDimensions.Mass do
  @moduledoc """
  Base units for mass measurements in metric and imperial.
  """
  @moduledoc since: "0.2.1"

  def ounces(q),
    do: %ExDimensions.Quantity{
      value: q,
      units: [ExDimensions.Mass.Ounces]
    }

  def pounds(q),
    do: %ExDimensions.Quantity{
      value: q,
      units: [ExDimensions.Mass.Pounds]
    }

  def grams(q),
    do: %ExDimensions.Quantity{
      value: q,
      units: [ExDimensions.Mass.Grams]
    }

  def kilograms(q),
    do: %ExDimensions.Quantity{
      value: q,
      units: [ExDimensions.Mass.Kilograms]
    }
end

