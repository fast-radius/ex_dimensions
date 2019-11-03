defmodule Units.Math do
  defmacro __using__(_opts) do
    quote do
      import Kernel, except: [{:+, 2}, {:-, 2}, {:*, 2}, {:/, 2}]

      def %{value: v1, units: u, denom: d} + %{value: v2, units: u, denom: d} do
        %Units.Quantity{value: v1 + v2, units: u}
      end

      def %{value: v1, units: u, denom: d} - %{value: v2, units: u, denom: d} do
        %Units.Quantity{value: v1 - v2, units: u}
      end

      def %{value: v1, units: u, denom: d} * x when is_number(x) do
        %Units.Quantity{value: v1 * x, units: u, denom: d}
      end

      def %{value: v1, units: [u | u_rest], denom: []} *
            %{value: v2, units: [u | u_rest2], denom: []} do
        %Units.Quantity{value: v1 * v2, units: [u | u_rest] ++ [u | u_rest2], denom: []}
      end

      def %{value: v1, units: [u | u_rest], denom: [d | d_rest]} *
            %{value: v2, units: [u | u_rest2], denom: [d | d_rest2]} do
        %Units.Quantity{
          value: v1 * v2,
          units: [u | u_rest] ++ [u | u_rest2],
          denom: [d | d_rest] ++ [d | d_rest2]
        }
      end

      def %{value: v1, units: u, denom: d} / x when is_number(x) do
        %Units.Quantity{value: v1 / x, units: u, denom: d}
      end

      def %{value: v1, units: [u | u_rest], denom: []} /
            %{value: v2, units: [u | u_rest], denom: []} do
        v1 / v2
      end

      def %{value: v1, units: u, denom: []} / %{value: v2, units: u2, denom: []} do
        %Units.Quantity{value: v1 / v2, units: u, denom: u2}
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
    end
  end
end
