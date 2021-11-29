defmodule Units.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_dimensions,
      version: "0.3.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "ExDimensions",
      docs: [main: "ExDimensions"],
      package: package(),
      description: "Dimensional analysis and unit conversions for Elixir.",
      source_url: "https://github.com/fast-radius/ex_dimensions"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.6"},
      {:ex_doc, "~> 0.19", only: :dev},
      {:jason, "~> 1.0"},
      {:libgraph, "~> 0.13.3"},
      {:nimble_parsec, "~> 0.5.1"},
      # Dev included for formatter
      {:stream_data, "~> 0.5.0", only: [:dev, :test], runtime: Mix.env() == :test},
      {:triq, "~> 1.3.0", only: :test}
    ]
  end

  defp package do
    [
      name: "ex_dimensions",
      licenses: ["BSD-3-Clause"],
      links: %{"GitHub" => "https://github.com/fast-radius/ex_dimensions"}
    ]
  end
end
