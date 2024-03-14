import 'package:flutter/material.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Controllers/auth_controller.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController name = TextEditingController();
    AuthenticationController authenticationController =
        Get.put(AuthenticationController());
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        TextField(
          controller: name,
          decoration: InputDecoration(
            hintText: "Name",
            prefixIcon: Icon(
              Icons.person,
            ),
          ),
        ),
        SizedBox(
          height: 20,
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
        Obx(() => authenticationController.loading.value
            ? CircularProgressIndicator(
                color: darkOnPrimaryContainer,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      authenticationController.signInDetails(
                        email.text,
                        password.text,
                        name.text,
                      );
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
                            "Sign Up",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
      ],
    );
  }
}
