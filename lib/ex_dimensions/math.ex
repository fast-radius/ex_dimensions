defmodule ExDimensions.Math do
  @moduledoc """
  This module contains the required macros to perform math on unit quantities.
  It must be `use`d in the current scope for the math functions to work properly.
  Math on standard values will still work as expected if this module is `use`d.

  Using these math functions will ensure proper dimensional analysis is performed
  on quantities.  The following rules are enforced:

    * Quantities with different units may not be added or subtracted
    * Quantities may not be added or subtracted with plain scalar numbers
    * Quantities may be multiplied and divided with scalars
    * Quantities with different units that are multiplied and divided will have 
      their units changed as needed

  Any math operations that violate these rules will result in an ArithmeticError
  that will bubble up to the caller.
  """
  @moduledoc since: "0.1.0"

  defmacro __using__(_opts) do
    quote do
      import Kernel,
        except: [
          {:+, 2},
          {:-, 2},
          {:*, 2},
          {:/, 2},
          {:<, 2},
          {:<=, 2},
          {:>, 2},
          {:>=, 2},
          {:==, 2}
        ]

      def %{value: v1, units: u, denom: d} + %{value: v2, units: u, denom: d} do
        %ExDimensions.Quantity{value: v1 + v2, units: u, denom: d}
      end

      def %{value: v1, units: u, denom: d} - %{value: v2, units: u, denom: d} do
        %ExDimensions.Quantity{value: v1 - v2, units: u, denom: d}
      end

      def %{value: v1, units: u, denom: d} * x when is_number(x) do
        %ExDimensions.Quantity{value: v1 * x, units: u, denom: d}
      end

      def %{value: v1, units: u, denom: []} *
            %{value: v2, units: u2, denom: []} do
        %ExDimensions.Quantity{value: v1 * v2, units: u ++ u2, denom: []}
      end

      def %{value: v1, units: u, denom: d} *
            %{value: v2, units: u2, denom: d2} do
        %ExDimensions.Quantity{
          value: v1 * v2,
          units: u ++ u2,
          denom: d ++ d2
        }
      end

      def %{value: v1, units: u, denom: d} / x when is_number(x) do
        %ExDimensions.Quantity{value: v1 / x, units: u, denom: d}
      end

      def %{value: v1, units: [u | u_rest], denom: []} /
            %{value: v2, units: [u | u_rest], denom: []} do
        v1 / v2
      end

      def %{value: v1, units: u, denom: []} / %{value: v2, units: u2, denom: []} do
        {units, denom} = cancel_units(u, u2)
        %ExDimensions.Quantity{value: v1 / v2, units: units, denom: denom}
      end

      def %{value: v1, units: u, denom: d} > %{value: v2, units: u, denom: d} do
        v1 > v2
      end

      def %{value: v1, units: u, denom: d} >= %{value: v2, units: u, denom: d} do
        v1 >= v2
      end

      def %{value: v1, units: u, denom: d} < %{value: v2, units: u, denom: d} do
        v1 < v2
      end

      def %{value: v1, units: u, denom: d} <= %{value: v2, units: u, denom: d} do
        v1 <= v2
      end

      def %{value: v1, units: u, denom: d} == %{value: v2, units: u, denom: d} do
        v1 == v2
      end

      defp cancel_units(u1, u2) do
        u2
        |> Enum.reduce({u1, u2}, fn u, {num, denom} ->
          if Enum.member?(num, u) do
            {List.delete(num, u), List.delete(denom, u)}
          else
            {num, denom}
          end
        end)
      end

      def pow(u, num) do
        List.duplicate(u, num)
      end

      def left + right do
        Kernel.+(left, right)
      end

      def left - right do
        Kernel.-(left, right)
      end

      def left * right do
        Kernel.*(left, right)
      end

      def left / right do
        Kernel./(left, right)
      end

      def left < right do
        Kernel.<(left, right)
      end

      def left <= right do
        Kernel.<=(left, right)
      end

      def left > right do
        Kernel.>(left, right)
      end

      def left >= right do
        Kernel.>=(left, right)
      end

      def left == right do
        Kernel.==(left, right)
      end
    end
  end
end
