import 'package:flutter/material.dart';
import 'package:food_ninja/src/cores/index.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  handlerBack(BuildContext ctx) {
    return () => ctx.pop();
  }

  handlerNext(BuildContext ctx) {
    return () => ctx.pushNamed("resetpassword");
  }

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                            margin:
                                const EdgeInsets.only(right: 100, bottom: 18),
                            child: const Text(
                              "Forgot password ?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "BentonSans-Bold",
                                  fontSize: 30),
                            ),
                          ),
                          const Text(
                            "Select which contact detail should we use to reset your password.",
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
                      child: Column(children: [
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: MaterialButton(
                            onPressed: () {},
                            color: Colors.white12,
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 10),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image(
                                        height: 40,
                                        width: 40,
                                        image:
                                            AssetImage(appIcons["IC_CHAT"]!)),
                                    const SizedBox(width: 18),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Via SMS :",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14,
                                              fontFamily: "BentonSans-Medium"),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 4),
                                          child: const Text(
                                            "•••• •••• 7879",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily:
                                                    "BentonSans-Medium"),
                                          ),
                                        ),
                                      ],
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 10),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image(
                                        height: 40,
                                        width: 40,
                                        image:
                                            AssetImage(appIcons["IC_EMAIL"]!)),
                                    const SizedBox(width: 18),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Via Email :",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14,
                                              fontFamily: "BentonSans-Medium"),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(top: 4),
                                          child: const Text(
                                            "•••••• @gmail.com",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily:
                                                    "BentonSans-Medium"),
                                          ),
                                        ),
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ))),
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Center(
                    child: MaterialButton(
                  onPressed: widget.handlerNext(context),
                  color: Colors.green,
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 12, left: 32, right: 32),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Text(
                    AppLocalizations.of(context)!.next,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "BentonSans-Black"),
                  ),
                )),
              )
            ],
          ))
        ],
      ),
      backgroundColor: const Color(0xFF0D0D0D),
    );
  }
}
