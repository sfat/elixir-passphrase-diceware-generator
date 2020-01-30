defmodule Library.MixProject do
  use Mix.Project

  def project do
    [
      app: :passphrase_generator,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.9",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "Passphrase Generator",
      source_url: "https://github.com/sfat/elixir-passphrase-diceware-generator"
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Library.Application, []}
    ]
  end

  defp description do
    "Passphrase generator based on [Diceware](http://world.std.com/~reinhold/diceware.html) technique"
  end


  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "passphrase_generator",
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => "https://github.com/sfat/elixir-passphrase-diceware-generator"
      }
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
    ]
  end
end
