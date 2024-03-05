import 'package:flutter/material.dart';
import 'package:food_ninja/src/cores/index.dart';
import 'package:food_ninja/src/widgets/index.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SlidingUpPanel(
            minHeight: MediaQuery.of(context).size.height -
                (MediaQuery.of(context).size.width - 18),
            maxHeight: MediaQuery.of(context).size.height * .9,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          appImages["IMG_AVATAR"]!,
                          height: MediaQuery.of(context).size.width,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      top: MediaQuery.of(context).padding.top + 12,
                      right: 12,
                      child: IconButton(
                          onPressed: () {
                            context.goNamed("login");
                          },
                          icon: const Icon(
                            IconlyBroken.logout,
                            size: 24,
                            color: Color.fromARGB(255, 33, 33, 33),
                          )))
                ],
              ),
            ),
            panelBuilder: (ctrl) => PanelProfile(controller: ctrl)));
  }
}

class PanelProfile extends StatelessWidget {
  final ScrollController controller;
  const PanelProfile({super.key, required this.controller});

  renderTileFavorite() {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 12, vertical: 10),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 40, 40, 40),
          borderRadius:
              BorderRadius.all(Radius.circular(10))),
      child: Row(children: [
        Image.asset(
          appImages["IMG_EX_MENU"]!,
          height: 56,
          width: 56,
        ),
        const SizedBox(width: 12,),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Chicken Spicy",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "BentonSans-Bold",
                      fontSize: 16)),
              Text(
                "Waroenk Kita",
                style: TextStyle(
                    fontFamily: "BentonSans-Regular",
                    color: Color.fromARGB(255, 114, 114, 114),
                    fontSize: 12),
              ),
              Text(
                '\$ 35',
                style: TextStyle(
                    fontFamily: "BentonSans-Bold",
                    color: Color.fromARGB(255, 4, 173, 38),
                    fontSize: 18),
              ),
            ],
          )
        )
      ]));          
  }
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
      child: Container(
        color: const Color(0xFF0D0D0D),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 24),
                height: 6,
                width: 48,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(47, 254, 246, 237),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(20, 254, 171, 29),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: const Text(
                "Member Gold",
                style: TextStyle(
                    color: Color(0xFFFEAD1D),
                    fontFamily: "BentonSans-Regular",
                    fontSize: 14),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Anam Wibisono",
                          style: TextStyle(
                              fontFamily: "BentonSans-Bold",
                              color: Colors.white,
                              fontSize: 28),
                        ),
                        Text(
                          "anamwp55@gmail.com",
                          style: TextStyle(
                              fontFamily: "BentonSans-Regular",
                              color: Color.fromARGB(255, 114, 114, 114),
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        appIcons["IC_EDIT"]!,
                        height: 24,
                        width: 24,
                      ))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 40, 40, 40),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: [
                  Image.asset(
                    appImages["IMG_LEADING_VOUCHER"]!,
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    "You have 3 voucher",
                    style: TextStyle(
                        fontFamily: "BentonSans-Medium",
                        fontSize: 14,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                    child: const Text(
                      "Favorite",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "BentonSans-Bold",
                          fontSize: 16),
                    ),
                  ),
                  renderTileFavorite(),
                  renderTileFavorite(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
