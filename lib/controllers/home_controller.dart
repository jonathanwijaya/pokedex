import 'package:get/get_connect.dart';
import 'package:get/state_manager.dart';
import 'package:pokedex/models/pokedex_model.dart';
import 'package:pokedex/utils/base_controllers.dart';
import 'package:pokedex/utils/constants.dart';
// import 'package:permission_handler/permission_handler.dart';

class HomeController extends BaseControllers {
  RxList<PokedexModel> arrPokedex = RxList();

  List pokemonMap = [
    {
      'map': kKantoMap,
      'region_name': 'Kanto',
    }
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    load();
  }

  @override
  void load() {
    // TODO: implement load
    super.load();
    print('masuk');
    api.fetchPokedex(
      controllers: this,
    );
  }

  parseData(List data) {
    arrPokedex.clear();

    for (Map map in data) {
      PokedexModel model = PokedexModel.fromJson(map);
      arrPokedex.add(model);
    }
  }

  @override
  Future<void> loadSuccess({
    required int requestCode,
    required Response<dynamic> response,
  }) async {
    super.loadSuccess(requestCode: requestCode, response: response);
    parseData(response.body['pokemon_entries']);
  }

  @override
  void loadFailed({required int requestCode, required Response<dynamic> response}) {
    super.loadFailed(requestCode: requestCode, response: response);

    print(response);
    // Utils.popupFail(response: response);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
