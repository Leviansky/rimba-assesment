// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rimba_assesment/app/data/models/response_model.dart';
import 'package:rimba_assesment/app/data/services/auth_services.dart';
import 'package:rimba_assesment/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final errorName = "".obs;
  final errorPhone = "".obs;
  final errorEmail = "".obs;
  final errorPassword = "".obs;

  final isLoading = false.obs;
  final isButtonAvailable = false.obs;
  final phoneRegex = RegExp(r'^[0-9]{10,15}$');
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  Future<bool> checkValidAllVariable() async {
    var isValid = true;
    errorName.value = "";
    errorPhone.value = "";
    errorEmail.value = "";
    errorPassword.value = "";

    if (name.text.isEmpty) {
      isValid = false;
      errorName.value = "Name must be filled";
    }
    if (phone.text.isEmpty) {
      isValid = false;
      errorPhone.value = "Phone must be filled";
    } else if (!phoneRegex.hasMatch(phone.text)) {
      isValid = false;
      errorPhone.value = "Invalid phone format";
    }
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

  void checkButtonAvailable() {
    var isValid = true;

    if (name.text.isEmpty) {
      isValid = false;
    }
    if (phone.text.isEmpty) {
      isValid = false;
    }
    if (email.text.isEmpty) {
      isValid = false;
    }
    if (password.text.isEmpty) {
      isValid = false;
    }

    if (isValid) {
      isButtonAvailable.value = true;
    } else {
      isButtonAvailable.value = false;
    }
  }

  void register() async {
    bool isValid = await checkValidAllVariable();
    print("masuk register $isValid");

    if (!isValid) {
      return;
    }

    isLoading.value = true;
    try {
      var bodyRequest = {
        "name": name.text,
        "phoneNumber": phone.text,
        "email": email.text,
        "password": password.text,
      };

      print(bodyRequest);
      final response = await AuthService().register(bodyRequest);
      if (response != null) {
        if (response.success) {
          Get.defaultDialog(
            title: "Registration Success",
            middleText: response.message ?? "Please login below.",
            textConfirm: "Login",
            onConfirm: () {
              Get.offNamed(Routes.LOGIN);
            },
          );
          clearForm();
        } else {
          Get.defaultDialog(
            title: "Registration Failed",
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
    name.clear();
    phone.clear();
    email.clear();
    password.clear();
    errorName.value = "";
    errorPhone.value = "";
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
