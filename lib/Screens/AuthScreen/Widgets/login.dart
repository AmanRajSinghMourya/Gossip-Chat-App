import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Controllers/auth_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    AuthenticationController authenticationController =
        Get.put(AuthenticationController());

    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        TextField(
          controller: email,
          decoration: InputDecoration(
            hintText: "Email",
            prefixIcon: Icon(
              Icons.email_outlined,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: password,
          decoration: InputDecoration(
            hintText: "Password",
            prefixIcon: Icon(
              Icons.password_rounded,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        //wrap with obx so if its value change during run time than also it can update
        Obx(
          () => authenticationController.loading.value
              ? CircularProgressIndicator(
                  color: darkOnPrimaryContainer,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        authenticationController.loginDetails(
                            email.text, password.text);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: darkButtonColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock_open_outlined,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Login",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
