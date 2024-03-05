import 'package:flutter/material.dart';
import 'package:food_ninja/src/cores/index.dart';
import 'package:food_ninja/src/widgets/index.dart';
import 'package:go_router/go_router.dart';
import 'package:validators/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  handlerLogin(BuildContext ctx) {
    return () => ctx.goNamed("dashboard");
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailField = TextEditingController();
  final passwordField = TextEditingController();

  late String email = "";

  Future<Object?> Function() handlerSignUp(BuildContext ctx) {
    return () => ctx.pushNamed("signup");
  }

  Future<Object?> Function() handlerForgotPassword(BuildContext ctx) {
    return () => ctx.pushNamed("forgotpassword");
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
                margin: const EdgeInsets.only(top: 120, left: 40, right: 40),
                child: Column(children: [
                  Input(
                      controller: emailField,
                      placeholder: "Email",
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
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
                      placeholder: "Password",
                      obscure: true,
                      maxCharacter: 16,
                      prefixIcon: Container(
                        height: 1,
                        width: 1,
                        padding: const EdgeInsets.all(11),
                        margin: const EdgeInsets.only(left: 2.5),
                        child: Image.asset(
                          appIcons["IC_LOCK"]!,
                          fit: BoxFit.contain,
                        ),
                      )),
                ]),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Text(
                    "Or Continue With",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: "BentonSans-Medium",
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.white12,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 10),
                        child: Row(children: [
                          Image(
                              height: 24,
                              width: 24,
                              image: AssetImage(appIcons["IC_FACEBOOK"]!)),
                          const SizedBox(width: 14),
                          const Text(
                            "Facebook",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: "BentonSans-Bold"),
                          )
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.white12,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 10),
                        child: Row(children: [
                          Image(
                              height: 24,
                              width: 24,
                              image: AssetImage(appIcons["IC_GOOGLE"]!)),
                          const SizedBox(width: 14),
                          const Text(
                            "Google",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: "BentonSans-Bold"),
                          )
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              if (isEmail(email))
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  child: TouchableOpacity(
                      onPress: handlerForgotPassword(context),
                      activeOpacity: .5,
                      child: const Text(
                        "Forgot Your Password?",
                        style: TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.green,
                        ),
                      )),
                )
              else
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                ),
              MaterialButton(
                onPressed: widget.handlerLogin(context),
                color: Colors.green,
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, left: 32, right: 32),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "BentonSans-Black"),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                child: TouchableOpacity(
                  onPress: handlerSignUp(context),
                  activeOpacity: .5,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.green),
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
