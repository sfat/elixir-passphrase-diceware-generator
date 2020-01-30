defmodule Library.WordRepository do
  use GenServer
  alias Library.FileLoader

  @moduledoc """
  Module responsible for retrieval of words used by the diceware generator
  """

  ## GenServer API
  @doc """
  GenServer.init/1 callback
  """
  def init(state) do
    {:ok, state}
  end

  def handle_call(:get_words, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:get_word, number}, _from, state) do
    word =
      state
      |> Enum.filter(fn %{number: n, word: _} -> n == number end)
      |> Enum.take(1)

    {:reply, word, state}
  end

  ## Client API / Helper functions
  @doc """
  Start the word repository and link it.
  This is a helper function
  """
  def start_link(_state \\ %{}) do
    GenServer.start_link(__MODULE__, FileLoader.load_words(), name: __MODULE__)
  end

  def get_words, do: GenServer.call(__MODULE__, :get_words)

  def get_word_by_number(number), do: GenServer.call(__MODULE__, {:get_word, number})
end
