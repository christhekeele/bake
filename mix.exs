defmodule Bake.Mixfile do
  use Mix.Project

  def project do
    [app: :bake,
     version: "0.1.1-dev",
     elixir: "~> 1.1",
     escript: [main_module: Bake.Cli, name: "bake", path: "/usr/local/bin/bake"],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison, :poison, :crypto, :ssl, :ssh, :sshex, :mix, :conform, :porcelain]]
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
    [
      {:httpoison, "~> 0.8.0"},
      {:poison, "~> 1.5.0"},
      {:exrm, "~> 0.19.8"},
      {:git_cli, "~> 0.1.0"},
      {:sshex, "~> 1.3"},
      {:bake_utils, path: "../bake_utils"},
      {:porcelain, "~> 2.0"},
      {:sweet_xml, "~> 0.2"},
      {:httpoison, "~> 0.7"},
      {:ex_aws, "~> 0.4.11"}
    ]
  end
end
