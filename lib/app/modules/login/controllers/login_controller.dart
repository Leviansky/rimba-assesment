// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rimba_assesment/app/data/models/profile_model.dart';
import 'package:rimba_assesment/app/data/services/auth_services.dart';
// import 'package:rimba_assesment/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final errorEmail = "".obs;
  final errorPassword = "".obs;
  final isLoading = false.obs;
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  Future<bool> checkValidAllVariable() async {
    var isValid = true;
    errorEmail.value = "";
    errorPassword.value = "";

    if (email.text.isEmpty) {
      isValid = false;
      errorEmail.value = "Email must be filled";
    } else if (!emailRegex.hasMatch(email.text)) {
      isValid = false;
      errorEmail.value = "Invalid email format";
    }
    if (password.text.isEmpty) {
      isValid = false;
      errorPassword.value = "Password must be filled";
    }

    return isValid;
  }

  void login() async {
    bool isValid = await checkValidAllVariable();
    if (!isValid) {
      return;
    }

    isLoading.value = true;
    try {
      var bodyRequest = {
        "email": email.text,
        "password": password.text,
      };
      final response = await AuthService().login(bodyRequest);
      print(response);

      if (response != null) {
        if (response.success) {
          ProfileModel data = ProfileModel.fromJson(response.data as Map<String, dynamic>);
          print("cek dapat token ga ==> ${data.accessToken}");
          box.write("accessToken", data.accessToken);
          box.write("nameProfile", data.name);
          // clearForm();
        } else {
          Get.defaultDialog(
            title: "Login Failed",
            middleText:
                response.message ?? "An error occurred. Please try again.",
            textConfirm: "OK",
            onConfirm: () {
              Get.back();
            },
          );
        }
      }

      isLoading.value = false;
    } catch (e) {
      print(e);
    } finally {
      // Reset loading state
      isLoading.value = false;
    }
  }

  void clearForm() {
    email.clear();
    password.clear();
    errorEmail.value = "";
    errorPassword.value = "";
  }

  @override
  void onInit() {
    super.onInit();
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
