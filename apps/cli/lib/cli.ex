defmodule CLI do
  @moduledoc """
  Usage: ./passphrase-generator [OPTIONS]

  Options:
  -h, --help        Help menu
  -w, --words       Number of words to generate (default: 10)
  -s, --separator   Separator used to delimit each word generated (default: " " - space)

  Example with default parameters
  #{IO.ANSI.cyan <> "$ ./passphrase-generator"}
  #{IO.ANSI.reset()}

  Output:
  #{IO.ANSI.light_yellow <> "pumice showing viewpoint utilize slobbery cape shaded ivy lapel doubling"}
  #{IO.ANSI.reset()}

  Example overriding the number of words:
  #{IO.ANSI.cyan <> "$ ./passphrase-generator --words 5"}
  #{IO.ANSI.reset()}

  Output:
  #{IO.ANSI.light_yellow <> "petty circling operative caregiver tumble"}
  #{IO.ANSI.reset()}

  Example overriding the separator:
  #{IO.ANSI.cyan <> "$ ./passphrase-generator --separator \",\""}
  #{IO.ANSI.reset()}

  Output:
  #{IO.ANSI.light_yellow <> "dealt,jukebox,gladly,oxymoron,abdominal,case,finicky,parking,shifter,laundry"}
  #{IO.ANSI.reset()}

  Example overriding both number of words and separator:
  #{IO.ANSI.cyan <> "$ ./passphrase-generator --separator \"-\" --words 5"}
  #{IO.ANSI.reset()}

  Output:
  #{IO.ANSI.light_yellow <> "provable-preschool-sitter-pacify-bagginess"}
  #{IO.ANSI.reset()}
  """
  alias Library.PassphraseGenerator

  def main(args \\ []) do
    args
    |> parse_args
    |> process
  end

  defp parse_args(args) do
    options = %{
      :words => PassphraseGenerator.get_default_number_of_words(),
      :separator => PassphraseGenerator.get_default_separator()
    }

    cmd_opts =
      OptionParser.parse(
        args,
        switches: [
          help: :boolean,
          words: :integer,
          separator: :string
        ],
        aliases: [
          h: :help,
          w: :words,
          s: :separator
        ]
      )

    case cmd_opts do
      {[help: true], _, _} ->
        :help

      {[], args, []} ->
        {options, args}

      {opts, args, []} ->
        {Enum.into(opts, options), args}

      _ ->
        :help
    end
  end

  def process(:help) do
    IO.puts(@moduledoc)
    System.halt(0)
  end

  def process({options, _args}) do
    IO.puts("")
    IO.puts(IO.ANSI.light_yellow <> PassphraseGenerator.generate_passphrase(options))
    IO.ANSI.reset()
    IO.puts("")
  end
end
