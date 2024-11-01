import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:rimba_assesment/app/modules/register/widgets/custome_textfield.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: ScrollController(),
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 6.0,
                  ),
                  child: Text(
                    'Please enter a few details below.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 16.0,
                ),

                // NAME
                CustomTextField(
                  label: "Name",
                  hintText: "Please fill this name",
                  controller: controller.name,
                  maxLength: 20,
                  leadingIcon: Icons.person,
                  onChanged: (value) {
                    controller.checkButtonAvailable();
                  },
                ),
                Obx(
                  () => controller.errorName.value != ""
                      ? Text(
                          controller.errorName.value,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        )
                      : SizedBox.shrink(),
                ),

                // PHONE
                CustomTextField(
                  label: "Phone",
                  hintText: "Please fill this phone",
                  controller: controller.phone,
                  maxLength: 20,
                  leadingIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    controller.checkButtonAvailable();
                  },
                ),
                Obx(
                  () => controller.errorPhone.value != ""
                      ? Text(
                          controller.errorPhone.value,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        )
                      : SizedBox.shrink(),
                ),

                // EMAIL
                CustomTextField(
                  label: "Email",
                  hintText: "Please fill this email",
                  controller: controller.email,
                  maxLength: 20,
                  leadingIcon: Icons.mail,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    controller.checkButtonAvailable();
                  },
                ),
                Obx(
                  () => controller.errorEmail.value != ""
                      ? Text(
                          controller.errorEmail.value,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        )
                      : SizedBox.shrink(),
                ),

                // PASSWORD
                CustomTextField(
                  label: "Password",
                  hintText: "Please fill this pasword",
                  controller: controller.password,
                  maxLength: 20,
                  leadingIcon: Icons.mail,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
                  onChanged: (value) {
                    controller.checkButtonAvailable();
                  },
                ),
                Obx(
                  () => controller.errorPassword.value != ""
                      ? Text(
                          controller.errorPassword.value,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        )
                      : SizedBox.shrink(),
                ),

                Container(
                  margin: const EdgeInsets.only(
                    top: 32.0,
                  ),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      controller.register();
                    },
                    child: Obx(
                      () => controller.isLoading.value
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Register",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
