import 'package:flutter/material.dart';
import 'package:food_ninja/src/cores/index.dart';
import 'package:food_ninja/src/presentations/authentications/widgets/checkbox.dart';
import 'package:food_ninja/src/widgets/index.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailField = TextEditingController();
  final passwordField = TextEditingController();

  handlerSignUp() {
    debugPrint(emailField.text);
    debugPrint(passwordField.text);
  }

  handlerLogin(BuildContext ctx) {
    return () => ctx.goNamed("login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            appImages["IMG_BG_SPLASH"]!,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
              child: SafeArea(
                  child: Flex(
            direction: Axis.vertical,
            children: [
              Center(
                child: Container(
                  height: 180,
                  width: 180,
                  margin: const EdgeInsets.only(top: 24),
                  child: Image(
                    image: AssetImage(appImages["IMG_APP_LEADING"]!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 80, left: 40, right: 40, bottom: 60),
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: const Center(
                        child: Text(
                      "Sign Up for Free",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "BentonSans-Bold",
                          fontSize: 24),
                    )),
                  ),
                  Input(
                      controller: emailField,
                      placeholder: "Name",
                      margin: const EdgeInsets.only(bottom: 8),
                      maxCharacter: 32,
                      prefixIcon: Container(
                        height: 1,
                        width: 1,
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.only(left: 4),
                        child: Image.asset(
                          appIcons["IC_PROFILE"]!,
                          fit: BoxFit.contain,
                        ),
                      )),
                  Input(
                      controller: passwordField,
                      placeholder: "Email",
                      maxCharacter: 16,
                      prefixIcon: Container(
                        height: 1,
                        width: 1,
                        padding: const EdgeInsets.all(11),
                        margin: const EdgeInsets.only(left: 3),
                        child: Image.asset(
                          appIcons["IC_MESSAGE"]!,
                          fit: BoxFit.contain,
                        ),
                      )),
                  Input(
                      controller: passwordField,
                      placeholder: "Password",
                      obscure: true,
                      maxCharacter: 16,
                      prefixIcon: Container(
                        height: 1,
                        width: 1,
                        padding: const EdgeInsets.all(11),
                        margin: const EdgeInsets.only(left: 3),
                        child: Image.asset(
                          appIcons["IC_LOCK"]!,
                          fit: BoxFit.contain,
                        ),
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 8, left: 4),
                    child: Column(children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CheckBoxGreen(
                            value: false,
                            onPress: (b) {
                              debugPrint(b.toString());
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 1, left: 10),
                            child: Text(
                              "Keep me signed in",
                              style: TextStyle(color: Colors.white70),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CheckBoxGreen(
                              value: false,
                              onPress: (b) {
                                debugPrint(b.toString());
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 1, left: 10),
                              child: Text(
                                "Email me about special pricing",
                                style: TextStyle(color: Colors.white70),
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  )
                ]),
              ),
              MaterialButton(
                onPressed: handlerSignUp,
                color: Colors.green,
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, left: 32, right: 32),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  "Create an Account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "BentonSans-Black"),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                child: TouchableOpacity(
                  onPress: handlerLogin(context),
                  activeOpacity: .5,
                  child: const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.green,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          )))
        ],
      ),
      backgroundColor: const Color(0xFF0D0D0D),
    );
  }
}
