defmodule DiaPagamento.MixProject do
  use Mix.Project

  def project do
    [
      app: :dia_pagamento,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  defp escript do
    [main_module: DiaPagamento.CLI]
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
      {:timex, "~> 3.6"},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
    ]
  end
end
