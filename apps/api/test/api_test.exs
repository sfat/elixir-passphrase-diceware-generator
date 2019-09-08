defmodule ApiTest do
  use ExUnit.Case
  doctest Api

  test "greets the world" do
    assert Api.hello() == :world
  end
end
