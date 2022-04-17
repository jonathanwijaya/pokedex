// ignore_for_file: non_constant_identifier_names
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_boiler_plate/utils/base_api.dart';
import 'package:flutter_boiler_plate/utils/base_controllers.dart';

String _baseUrl = dotenv.env["BASE_URL"] ?? 'https://www.example.com';

class Api extends BaseApi {
  final String _exampleUrl = _baseUrl + 'example/';

  //Fetch API Example
  Future<void> exampleApiFetch({
    required BaseControllers controllers,
    required String exampleParams,
  }) =>
      apiFetch(
        url: '$_exampleUrl/example?params=$exampleParams',
        controller: controllers,
      );

  //Post API Example
  Future<void> exampleApiPost({
    required BaseControllers controllers,
    example,
    code,
  }) =>
      apiPost(
        url: baseUrl ?? ' ',
        controller: controllers,
        data: {'example': example},
      );

  Future<void> exampleEditPost({required BaseControllers controllers, id, notes, code}) {
    return apiPut(
      url: _exampleUrl,
      controller: controllers,
      data: {
        'example_id': id,
        'example_notes': notes,
      },
      code: code,
    );
  }
}
