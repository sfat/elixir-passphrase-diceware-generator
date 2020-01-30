defmodule Library.PassphraseGeneratorTest do
  use ExUnit.Case
  require Logger

  alias Library.PassphraseGenerator

  @moduletag :capture_log

  doctest Library.PassphraseGenerator

  test "generates a passphrase" do
    passphrase = PassphraseGenerator.generate_passphrase()
    IO.puts(passphrase)
    assert passphrase != ""
  end

  test "generates a passphrase with commas instead of spaces" do
    passphrase = PassphraseGenerator.generate_passphrase(10, ",")
    IO.puts(passphrase)
    assert String.contains?(passphrase, ",")
  end
end
