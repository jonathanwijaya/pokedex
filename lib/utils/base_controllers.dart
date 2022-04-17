import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '/utils/api.dart';
import '/utils/constants.dart';

abstract class BaseControllers extends GetxController {
  RxBool loading = false.obs;
  Rx<ControllerState> state = ControllerState.firstLoad.obs;
  final Api api = Get.put(Api());
  final GetStorage store = GetStorage();

  void setLoading(bool loading) {
    isLoading.value = !isLoading.value;
    if (loading) {
      state.value = ControllerState.loading;
    } else {
      state.value = ControllerState.loadingSuccess;
    }
  }

  RxBool get isLoading {
    return loading;
  }

  void load() {
    setLoading(true);
  }

  void loadSuccess({required int requestCode, required Response<dynamic> response}) {
    setLoading(false);
    state.value = ControllerState.loadingSuccess;
  }

  void loadFailed({required int requestCode, required Response<dynamic> response}) {
    setLoading(false);
    state.value = ControllerState.loadingFailed;
  }
}
