class PokemonModel {
  String name;
  String url;

  PokemonModel.fromJson(Map json)
      : name = json['name'],
        url = (json['url']);
}
