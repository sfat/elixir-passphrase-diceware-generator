defmodule Library.FileLoaderTest do
  use ExUnit.Case
  require Logger

  alias Library.FileLoader

  @moduletag :capture_log

  doctest Library.FileLoader

  test "loads words in memory" do
    words = FileLoader.load_words()
    assert words != []
  end

  test "get first word" do
    word =
      FileLoader.load_words()
      |> Enum.take(1)

    assert word == [%{number: 11111, word: "abacus"}]
  end
end
