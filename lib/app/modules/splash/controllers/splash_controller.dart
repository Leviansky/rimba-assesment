import 'dart:async';

import 'package:get/get.dart';
import 'package:rimba_assesment/app/routes/app_pages.dart';

class SplashController extends GetxController {
  void cekLogin() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (timer.tick > 1) {
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
