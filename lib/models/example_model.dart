
import 'package:flutter_boiler_plate/models/example_model-2.dart';

class ExampleModel {
  int id;
  String name;
  int week;
  int year;
  List<ExampleModel2> songs = [];

  ExampleModel.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        week = json['week'],
        year = json['year'] {
    if (json['songs'] != null) {
      for (Map item in json['songs']) {
        songs.add(ExampleModel2.fromJson(item));
      }
    }
  }
}

