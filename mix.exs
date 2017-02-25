defmodule Liquid.Mixfile do
  use Mix.Project

  def project do
    [ app: :liquid,
      version: "0.7.0",
      elixir: "~> 1.4",
      deps: deps(),
      name: "Liquid",
      description: description(),
      package: package(),
      source_url: "https://github.com/bettyblocks/liquid-elixir"]
  end

  # Configuration for the OTP application
  def application do
    [mod: {Liquid, []}]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [{:credo, "~> 0.2", only: [:dev, :test]},
     {:benchfella, "~> 0.3.0", only: [:dev, :test]},
     {:calendar, "~> 0.17"},
     {:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    """
    Liquid implementation in elixir
    """
  end

  defp package do
    [
      files: ["lib", "README*", "mix.exs"],
      maintainers: ["Peter Arentsen"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/nulian/liquid-elixir"}
    ]
  end
end
