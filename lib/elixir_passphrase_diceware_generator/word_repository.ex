defmodule WordRepository do
  @moduledoc """
  Module responsible for storing and retrieval of words used by the diceware generator
  """

  @doc """
  Load words from file
  """
  def load_words do
    File.stream!("priv/eff_large_wordlist.txt")
    |> Stream.map(&String.trim(&1))
    |> Stream.map(&String.split(&1, "\t"))
    |> Stream.map(fn [a, b] -> %{String.to_atom(a) => b} end)
    |> Enum.to_list
  end
end
