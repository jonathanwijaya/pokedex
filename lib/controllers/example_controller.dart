import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/state_manager.dart';
import 'package:pokedex/utils/base_controllers.dart';
// import 'package:permission_handler/permission_handler.dart';

class ExampleController extends BaseControllers {
  RxList pokemon = RxList();

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
  }

  @override
  Future<void> loadSuccess({
    required int requestCode,
    required Response<dynamic> response,
  }) async {
    super.loadSuccess(requestCode: requestCode, response: response);
    print(response);
  }

  @override
  void loadFailed({required int requestCode, required Response<dynamic> response}) {
    super.loadFailed(requestCode: requestCode, response: response);
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
