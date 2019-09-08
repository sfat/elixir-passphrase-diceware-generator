defmodule ElixirPassphraseDicewareGenerator.FileLoader do
  @moduledoc """
  Module responsible for retrieval of words used by the diceware generator
  """

  @doc """
  Load words from file
  """
  def load_words do
    File.stream!("priv/eff_large_wordlist.txt")
    |> Stream.map(&String.trim(&1))
    |> Stream.map(&String.split(&1, "\t"))
    |> Stream.map(fn [a, b] -> %{number: String.to_integer(a), word: b} end)
    |> Enum.to_list
  end
end
