defmodule Expinboard.Mixfile do
  use Mix.Project

  def project do
    [app: :expinboard,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  defp package do
    [
     files: ["lib", "mix.exs", "README*", "UNLICENSE"],
     maintainers: ["Thilko Richter"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/thilko/expinboard",
              "Docs" => "https://github.com/thilko/expinboard"}]
  end

  defp description do
    """
    A simple elixir pinboard client.
    """
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [ {:ibrowse, "~> 4.2"},
      {:httpotion, "~> 2.1.0"},
      {:exjsx, "~> 3.2.0"}]
  end
end
