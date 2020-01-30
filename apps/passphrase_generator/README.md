# Passphrase Generator

This the core of the passphrase generator. 

Based on the `apps/library/priv/eff_large_wordlist.txt`, where we have the map of numbers and words,
we will simulate the dice generation before choosing a word.

The library can be included as a dependency in your own Elixir project.

```elixir
def deps do
  [
    {:passphrase_generator, "~> 0.1.0"}
  ]
end
```
