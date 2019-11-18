defmodule Units.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_dimensions,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "ExDimensions",
      docs: [main: "ExDimensions"]
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
      {:ecto_sql, "~> 3.2.1"},
      {:excheck, "~> 0.6", only: :test},
      {:ex_doc, "~> 0.19", only: :dev},
      {:jason, "~> 1.0"},
      {:libgraph, "~> 0.13.3"},
      {:nimble_parsec, "~> 0.5.1"},
      {:triq, "~> 1.3.0", only: :test}
    ]
  end
end
