defmodule Unit.Conversions do
  defmacro __using__(_opts) do
    quote do
      def convert(v, [Units.Spatial.Inches], Units.Spatial.Feet) do
        v * 12
      end

      def convert(v, [Units.Spatial.Inches], Units.Spatial.Yards) do
        v * 36
      end

      def convert(v, [Units.Spatial.Inches], Units.Spatial.Miles) do
        v * 63360
      end

      def convert(v, [Units.Spatial.Inches], Units.Spatial.Millimeters) do
        v * 25.4
      end

      def convert(v, [Units.Spatial.Millimeters], Units.Spatial.Inches) do
        v / 25.4
      end

      def convert(v, [Units.Spatial.Millimeters], Units.Spatial.Nanometers) do
        v * 1_000_000
      end

      def convert(v, [Units.Spatial.Millimeters], Units.Spatial.Micrometers) do
        v * 1000
      end

      def convert(v, [Units.Spatial.Millimeters], Units.Spatial.Meters) do
        v / 1000
      end

      def convert(v, [Units.Spatial.Millimeters], Units.Spatial.Kilometers) do
        v / 1_000_000
      end

      def %{value: v1, units: u, denom: []} ~> u2 do
        %{value: convert(v1, u, u2), units: [u2], denom: []}
      end
    end
  end
end
