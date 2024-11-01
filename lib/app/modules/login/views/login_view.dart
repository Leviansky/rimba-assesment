import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rimba_assesment/app/modules/register/widgets/custome_textfield.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
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
                Center(
                  child: Image.asset(
                    "assets/vector/login-enter-vector.png",
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  'Hey, There 👋',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Find your product here!',
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
                    'Enter your email address and password to use the app',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 16.0,
                ),

                // EMAIL
                CustomTextField(
                  label: "Email",
                  hintText: "Please fill this email",
                  controller: controller.email,
                  maxLength: 20,
                  leadingIcon: Icons.mail,
                  keyboardType: TextInputType.emailAddress,
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
                  leadingIcon: Icons.lock,
                  keyboardType: TextInputType.visiblePassword,
                  isPassword: true,
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
                      controller.login();
                    },
                    child: Obx(
                      () => controller.isLoading.value
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Login ",
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
