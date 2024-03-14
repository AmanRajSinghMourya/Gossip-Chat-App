import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gossip/Config/colors.dart';
import 'package:gossip/Screens/AuthScreen/Widgets/login.dart';
import 'package:gossip/Screens/AuthScreen/Widgets/signup.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //to animate login and signUp
    RxBool isLogin = true.obs;
    return Container(
      // height: 400,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: darkPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          isLogin.value = true;
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.8,
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: isLogin.value
                                    ? Theme.of(context).textTheme.headlineSmall
                                    : Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          isLogin.value = false;
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.8,
                          child: Column(
                            children: [
                              Text(
                                "Sign Up",
                                style: isLogin.value
                                    ? Theme.of(context).textTheme.labelLarge
                                    : Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Obx(
                  () => isLogin.value ? LoginForm() : SignUpForm(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
