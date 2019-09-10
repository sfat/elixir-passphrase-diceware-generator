# Elixir Passphrase Diceware Generator

Passphrase generator based on [Diceware](http://world.std.com/~reinhold/diceware.html) technique

This project is split into 3 parts (apps):
1. library
2. cli
3. api

## 1. Library

This the core of the passphrase generator. 

Based on the `apps/library/priv/eff_large_wordlist.txt`, where we have the map of numbers and words,
we will simulate the dice generation before choosing a word.

The library can be included as a dependency in your own Elixir project.

## 2. CLI

Component that makes use of the library and will make an executable that can be used to generate a passphrase
directly from the command line.

You can find more info regarding the CLI [here](apps/cli/README.md)

##3. API

Component will create a REST API that will expose and let you generate a passphrase from your favorite
REST client (a GUI or programmatically)

