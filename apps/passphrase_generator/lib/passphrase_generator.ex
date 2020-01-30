defmodule Library.PassphraseGenerator do
  alias Library.WordGenerator

  @default_number_of_words 10
  @default_separator " "
  @moduledoc """
    Module responsible for generating the passphrase based on the diceware.
    Will make use of `Library.WordGenerator`
  """

  def generate_passphrase(%{:words => number_of_words, :separator => separator}) do
    1..number_of_words
    |> Enum.map(fn _ -> WordGenerator.generate() end)
    |> Enum.join(separator)
  end

  def get_default_number_of_words, do: @default_number_of_words
  def get_default_separator, do: @default_separator
end
