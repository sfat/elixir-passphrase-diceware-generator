defmodule Library.WordRepositoryTest do
  use ExUnit.Case
  require Logger

  alias Library.WordRepository

  @moduletag :capture_log

  doctest Library.WordRepository

  test "loads words in memory" do
    WordRepository.start_link()
    assert WordRepository.get_words() != []
  end

  test "get first word" do
    WordRepository.start_link()
    number = 11111
    word = WordRepository.get_word_by_number(number)
    assert word == [%{number: number, word: "abacus"}]
  end
end
