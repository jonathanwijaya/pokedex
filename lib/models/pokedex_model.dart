import 'package:pokedex/models/pokemon_model.dart';

class PokedexModel {
  int entryNumber;
  PokemonModel pokemonSpecies;

  PokedexModel.fromJson(Map json)
      : entryNumber = json['entry_number'],
        pokemonSpecies = PokemonModel.fromJson(json['pokemon_species']);
}
