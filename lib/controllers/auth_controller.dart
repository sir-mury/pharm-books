import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  RxBool isLoggedIn = false.obs;
  RxBool isObscure = false.obs;

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }
}
