# Elixirconf Pokemon Proto

## Description

Houses proto definitions for pokemon.

## Updating Definitions

After changing `.proto` files, regenerate elixir files by running:

```bash
$ protoc --elixir_out=plugins=grpc:./lib proto/* 
```

## Installation

Add `pokemon_proto` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:pokemon_proto, github: "castengo/elixirconf-pokemon-proto"}
  ]
end
```

