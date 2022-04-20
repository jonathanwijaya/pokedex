// ignore_for_file: non_constant_identifier_names
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pokedex/utils/base_api.dart';
import 'package:pokedex/utils/base_controllers.dart';

String _baseUrl = dotenv.env["BASE_URL"] ?? 'https://www.example.com';

class Api extends BaseApi {
  String _pokedexUrl = _baseUrl + 'pokedex/';

  //Fetch Pokedex
  Future<void> fetchPokedex({
    required BaseControllers controllers,
  }) {
    print(_pokedexUrl);
    return apiFetch(
      url: '$_pokedexUrl' + '2',
      controller: controllers,
    );
  }

  //Post API Example
  Future<void> exampleApiPost({
    required BaseControllers controllers,
    example,
    code,
  }) =>
      apiPost(
        url: baseUrl ?? '',
        controller: controllers,
        data: {'example': example},
      );

  Future<void> exampleEditPost({required BaseControllers controllers, id, notes, code}) {
    return apiPut(
      url: baseUrl ?? '',
      controller: controllers,
      data: {
        'example_id': id,
        'example_notes': notes,
      },
      code: code,
    );
  }
}
