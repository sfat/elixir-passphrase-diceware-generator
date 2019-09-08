defmodule ElixirPassphraseDicewareGenerator.WordGenerator do
  alias ElixirPassphraseDicewareGenerator.WordRepository

  @moduledoc """
  Module will generate 5 digits (simulating the dice roll) and form a number (i.e. 12345)
  This number will be used to search for the word associated with that number.
  """

  def generate do
    generated_number = generate_number()
    {:ok, generated_number, WordRepository.get_word_by_number(generated_number)}
  end

  def generate_number do
    :rand.seed(:erlang.now()) # don't use the default seed to increase randomness
    Enum.reduce(1..5, 0, fn (_, sum) -> Enum.random(1..6) + sum * 10 end)
  end
end
