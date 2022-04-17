
import 'package:pokedex/models/example_model-3.dart';

class ExampleModel2 {
  int position;
  ExampleModel3 song;

  ExampleModel2.fromJson(Map json)
      : position = json['position'],
        song = ExampleModel3.fromJson(json['song']);
}
