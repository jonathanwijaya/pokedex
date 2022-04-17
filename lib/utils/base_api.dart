import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_boiler_plate/utils/example_keys.dart';

import 'base_controllers.dart';

class BaseApi extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;

    httpClient.addRequestModifier((Request request) {
      String token = GetStorage().read(storageToken) ?? '';
      _print(data: token);
      request.headers['Authorization'] = "Bearer $token";
      request.headers['Accept'] = 'application/json';
      return Future.value(request);
    });

    // Adds auth token if possible
    httpClient.addAuthenticator((Request request) async {
      String token = GetStorage().read(storageToken) ?? '';
      _print(data: token);
      request.headers['Authorization'] = "Bearer $token";
      request.headers['Accept'] = 'application/json';
      return Future.value(request);
    });
  }

  /// BASE FUNCTIONS
  Future<void> apiFetch({
    required String url,
    required BaseControllers controller,
    int code = 1,
    bool debug = false,
  }) async {
    _print(doPrint: debug, data: url);
    final response = await get(url);
    _print(doPrint: debug, data: response.body);
    if (response.status.hasError) {
      _print(doPrint: debug, data: 'Error : $url');
      return controller.loadFailed(
        requestCode: code,
        response: response,
      );
    }

    controller.loadSuccess(requestCode: code, response: response);
  }

  Future<void> apiPut({
    required String url,
    required BaseControllers controller,
    required Map data,
    int code = 1,
    bool debug = false,
  }) async {
    _print(doPrint: debug, data: url);
    _print(doPrint: debug, data: data);
    final response = await put(url, data);
    _print(doPrint: debug, data: response.body);

    if (response.status.hasError) {
      _print(doPrint: debug, data: 'Error : $url');
      return controller.loadFailed(
        requestCode: code,
        response: response,
      );
    }

    controller.loadSuccess(requestCode: code, response: response);
  }

  Future<void> apiPost({
    required String url,
    required BaseControllers controller,
    required Map data,
    int code = 1,
    bool debug = false,
  }) async {
    _print(doPrint: debug, data: url);
    final response = await post(url, data);
    _print(doPrint: debug, data: data);
    _print(doPrint: debug, data: response.body);

    if (response.status.hasError) {
      _print(doPrint: debug, data: 'Error : $url');
      return controller.loadFailed(
        requestCode: code,
        response: response,
      );
    }

    controller.loadSuccess(requestCode: code, response: response);
  }

  Future<void> apiPostFile({
    required String url,
    required BaseControllers controller,
    required FormData form,
    int code = 1,
    bool debug = false,
  }) async {
    _print(doPrint: debug, data: url);
    final response = await post(url, form);
    _print(doPrint: debug, data: form);
    _print(doPrint: debug, data: response.body);

    if (response.status.hasError) {
      _print(doPrint: debug, data: 'Error : $url');
      return controller.loadFailed(
        requestCode: code,
        response: response,
      );
    }

    controller.loadSuccess(requestCode: code, response: response);
  }

  Future<void> apiDelete({
    required String url,
    required BaseControllers controller,
    int code = 1,
    bool debug = false,
  }) async {
    _print(doPrint: debug, data: url);
    final response = await delete(url);
    _print(
      doPrint: debug,
    );
    _print(doPrint: debug, data: response.body);

    if (response.status.hasError) {
      _print(doPrint: debug, data: 'Error : $url');
      return controller.loadFailed(
        requestCode: code,
        response: response,
      );
    }

    controller.loadSuccess(requestCode: code, response: response);
  }

  void _print({bool doPrint = false, dynamic data}) {
    if (doPrint) {
      try {
        // ignore: avoid_print
        print(json.encode(data));
      } catch (e) {
        log(data.toString());
      }
    }
  }
}
