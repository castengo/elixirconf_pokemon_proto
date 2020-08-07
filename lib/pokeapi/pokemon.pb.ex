defmodule Pokeapi.GetPokemonRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer,
          name: String.t()
        }
  defstruct [:id, :name]

  field :id, 1, type: :int32
  field :name, 2, type: :string
end

defmodule Pokeapi.GetPokemonResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pokemon: Pokeapi.Pokemon.t() | nil
        }
  defstruct [:pokemon]

  field :pokemon, 1, type: Pokeapi.Pokemon
end

defmodule Pokeapi.Pokemon do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer,
          name: String.t(),
          base_experience: integer,
          is_default: boolean,
          moves: [Pokeapi.Move.t()]
        }
  defstruct [:id, :name, :base_experience, :is_default, :moves]

  field :id, 1, type: :int32
  field :name, 2, type: :string
  field :base_experience, 3, type: :int32
  field :is_default, 4, type: :bool
  field :moves, 5, repeated: true, type: Pokeapi.Move
end

defmodule Pokeapi.Move do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: integer,
          name: String.t(),
          accuracy: integer,
          effect_chance: integer,
          pp: integer
        }
  defstruct [:id, :name, :accuracy, :effect_chance, :pp]

  field :id, 1, type: :int32
  field :name, 2, type: :string
  field :accuracy, 3, type: :int32
  field :effect_chance, 4, type: :int32
  field :pp, 5, type: :int32
end

defmodule Pokeapi.PokemonService.Service do
  @moduledoc false
  use GRPC.Service, name: "pokeapi.PokemonService"

  rpc :GetPokemon, Pokeapi.GetPokemonRequest, Pokeapi.GetPokemonResponse
end

defmodule Pokeapi.PokemonService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Pokeapi.PokemonService.Service
end
