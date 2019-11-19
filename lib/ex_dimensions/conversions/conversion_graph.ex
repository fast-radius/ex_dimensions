defmodule ExDimensions.Conversions.Graph do
  @moduledoc false

  defmacro __before_compile__(%Macro.Env{module: module}) do
    conversion_mappings =
      ExDimensions.Conversions.Spatial.mappings() ++
        ExDimensions.Conversions.Area.mappings() ++
        ExDimensions.Conversions.Volume.mappings() ++
        ExDimensions.Conversions.Temperature.mappings()
   IO.inspect(conversion_mappings)

    Module.put_attribute(
      module,
      :conversion_graph,
      conversion_mappings
      |> Enum.reduce(Graph.new(), fn {from, conversion_to_fn, conversion_from_fn, to}, g ->
        g
        |> Graph.add_vertex(from)
        |> Graph.add_vertex(to)
        |> Graph.add_edge(Graph.Edge.new(from, to, label: conversion_to_fn))
        |> Graph.add_edge(Graph.Edge.new(to, from, label: conversion_from_fn))
      end)
    )

    quote do
      # this will allow you to "eagerly" convert units consistently, even
      # if they are the same
      def convert(v, [u], u) do
        v
      end

      def convert(v, u1, u2) do
        path =
          @conversion_graph
          |> Graph.dijkstra(u1, u2)

        case path do
          nil ->
            {:error, :no_coversion_possible}

          p ->
            value =
              p
              |> Enum.chunk_every(2, 1, :discard)
              |> Enum.reduce(v, fn [n1, n2], v ->
                [%{label: [f, factor]}] = Graph.edges(@conversion_graph, n1, n2)
                f.(v, factor)
              end)

            {:ok, value}
        end
      end
    end
  end
end
