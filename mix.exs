defmodule Certstream.Mixfile do
  use Mix.Project

  def project do
    [
      app: :certstream,
      version: "1.6.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Certstream, []}
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 2.8"},
      {:easy_ssl, "~> 1.3"},
      {:honeybadger, "~> 0.15"},
      {:httpoison, "~> 1.7"},
      {:instruments, "~> 1.1"},
      {:jason, "~> 1.2"},
      {:number, "~> 1.0"},
      {:pobox, "~> 1.2"},

      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.13", only: :test}
    ]
  end

  defp aliases do
    [
      test: "test --no-start"
    ]
  end
end
