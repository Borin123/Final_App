import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final GetStorage _storage = GetStorage();

  final RxBool isFirstTime = true.obs;
  final RxBool isLoggedIn = false.obs;

  bool get firstTime => isFirstTime.value;
  bool get loggedIn => isLoggedIn.value;

  @override
  void onInit() {
    super.onInit();
    _loadInitialValues();
  }

  void _loadInitialValues() {
    isFirstTime.value = _storage.read('isFirstTime') ?? true;
    isLoggedIn.value = _storage.read('isLoggedIn') ?? false;
  }

  void setFirstTime(bool value) {
    isFirstTime.value = value;
    _storage.write('isFirstTime', value);
  }

  void logIn() {
    isLoggedIn.value = true;
    _storage.write('isLoggedIn', true);
  }

  void logOut() {
    isLoggedIn.value = false;
    _storage.write('isLoggedIn', false);
  }
}
