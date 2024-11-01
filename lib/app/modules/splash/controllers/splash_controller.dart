import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rimba_assesment/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final box = GetStorage();

  void cekLogin() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (timer.tick < 2) {
        final token = box.read("accessToken");
        print("cek tokeen ==> $token");
        if (token != null) {
          Get.offAllNamed(Routes.HOME);
          timer.cancel();
        }
      } else {
        Get.offAllNamed(Routes.AUTH);
        timer.cancel();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    cekLogin();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
