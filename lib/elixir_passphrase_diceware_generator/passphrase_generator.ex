defmodule ElixirPassphraseDicewareGenerator.PassphraseGenerator do
  alias ElixirPassphraseDicewareGenerator.WordGenerator

  @default_number_of_words 10
  @default_separator " "
  @moduledoc """
    Module responsible for generating the passphrase based on the diceware.
    Will make use of `ElixirPassphraseDicewareGenerator.WordGenerator`
  """

  def generate_passphrase(number_of_words \\ @default_number_of_words, separator \\ @default_separator) do
    1..number_of_words
    |> Enum.map(fn _ -> WordGenerator.generate() end)
    |> Enum.join(separator)
  end
end
