defmodule Library.WordGeneratorTest do
  use ExUnit.Case
  require Logger

  alias Library.WordGenerator

  @moduletag :capture_log

  doctest Library.WordGenerator

  test "generates a number" do
    generated_number = WordGenerator.generate_number()
    assert generated_number > 11110 && generated_number < 66667
  end

  test "gets a new word" do
    word = WordGenerator.generate()
    assert word != ""
  end
end
