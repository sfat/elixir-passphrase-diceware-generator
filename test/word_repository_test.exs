defmodule WordRepositoryTest do
  use ExUnit.Case
  require Logger

  alias WordRepository

  @moduletag :capture_log

  doctest WordRepository

  test "loads words in memory" do
     words = WordRepository.load_words()
     assert words != []
  end

  test "get first word" do
    word = WordRepository.load_words()
    |> Enum.take(1)

    assert word == [%{:"11111" => "abacus"}]
  end
end
