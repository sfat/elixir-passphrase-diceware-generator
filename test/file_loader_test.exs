defmodule ElixirPassphraseDicewareGenerator.FileLoaderTest do
  use ExUnit.Case
  require Logger

  alias ElixirPassphraseDicewareGenerator.FileLoader

  @moduletag :capture_log

  doctest ElixirPassphraseDicewareGenerator.FileLoader

  test "loads words in memory" do
    words = FileLoader.load_words()
    assert words != []
  end

  test "get first word" do
    word = FileLoader.load_words()
           |> Enum.take(1)

    assert word == [%{number: 11111, word: "abacus"}]
  end
end
