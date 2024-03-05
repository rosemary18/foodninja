import 'package:flutter/material.dart';
import 'package:food_ninja/src/cores/index.dart';
import 'package:food_ninja/src/widgets/index.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  handlerBack(BuildContext ctx) {
    return () => ctx.goNamed("login");
  }

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            appImages["IMG_BG_PATTERN"]!,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: Flex(
                        direction: Axis.vertical,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(
                            onPressed: widget.handlerBack(context),
                            color: const Color.fromARGB(22, 255, 144, 18),
                            padding: const EdgeInsets.all(12),
                            minWidth: 20,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: const Icon(
                              Icons.chevron_left,
                              color: Color(0xFFDA6317),
                              size: 28,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 100, bottom: 18),
                                  child: const Text(
                                    "Reset your password here ?",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "BentonSans-Bold",
                                        fontSize: 30),
                                  ),
                                ),
                                const Text(
                                  "Set your new password below.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "BentonSans-Regular",
                                      fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 120),
                            child: const Column(
                              children: [
                                Input(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  placeholder: "New Password",
                                  obscure: true,
                                ),
                                Input(
                                  margin: EdgeInsets.symmetric(vertical: 8),
                                  placeholder: "Confirm Password",
                                  obscure: true,
                                ),
                              ]
                            ),
                          ),
                        ],
                      ),
                    )
                  )
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Center(
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.green,
                      padding: const EdgeInsets.only(
                          top: 12, bottom: 12, left: 32, right: 32),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "BentonSans-Black"),
                      ),
                    )
                  ),
                )
              ],
            )
          )
        ],
      ),
      backgroundColor: const Color(0xFF0D0D0D),
    );
  }
}
