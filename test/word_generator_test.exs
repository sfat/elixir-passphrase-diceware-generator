defmodule ElixirPassphraseDicewareGenerator.WordGeneratorTest do
  use ExUnit.Case
  require Logger

  alias ElixirPassphraseDicewareGenerator.WordGenerator
  alias ElixirPassphraseDicewareGenerator.WordRepository

  @moduletag :capture_log

  doctest ElixirPassphraseDicewareGenerator.WordGenerator

  test "generates a number" do
    generated_number = WordGenerator.generate_number()
    assert generated_number > 11110 && generated_number < 66667
  end

  test "gets a new word" do
    {:ok, number, word} = WordGenerator.generate()
    assert word != ""
    assert word == WordRepository.get_word_by_number(number)
  end
end
