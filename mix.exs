defmodule GlUtils.Mixfile do
  use Mix.Project

  def project do
    [app: :gl_utils,
     version: "0.0.1",
     elixir: "~> 1.2",
     description: "All of the Erlang gl macros exposed as normal functions",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: [],
     package: package]
  end

  def application, do: [applications: []]
  defp package do
    [name: :gl_utils,
     files: ["src", "mix.exs", "README*", "LICENSE*"],
     maintainers: ["Michael Prins"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/requnix/gl_utils"}]
  end
end
