import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../cores/index.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final CarouselController ctrlCarousel = CarouselController();

  Widget buildSection(BuildContext context, int index) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Flex(
          direction: Axis.vertical,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 48, bottom: 48),
              child: Image(
                image: AssetImage(appImages[
                    (index == 0) ? "IMG_INTRO_BANNER" : "IMG_INTRO_BANNER_2"]!),
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 48, right: 48),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: (index == 0) ? 60 : 30,
                        right: (index == 0) ? 60 : 30),
                    child: Text(
                      (index == 0)
                          ? AppLocalizations.of(context)!.intro_banner_headline
                          : AppLocalizations.of(context)!
                              .intro_banner_headline_2,
                      textAlign: TextAlign.center,
                      style: textStyles["headline"],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    (index == 0)
                        ? AppLocalizations.of(context)!
                            .intro_banner_sub_headline
                        : AppLocalizations.of(context)!
                            .intro_banner_sub_headline_2,
                    textAlign: TextAlign.center,
                    style: textStyles["subHeadline"],
                  ),
                  const SizedBox(height: 24),
                  MaterialButton(
                    onPressed: () {
                      if (index == 1) {
                        context.goNamed("login");
                      } else {
                        ctrlCarousel.nextPage();
                      }
                    },
                    color: Colors.green,
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 32, right: 32),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      AppLocalizations.of(context)!.next,
                      style: textStyles["button"],
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateBloc, AppState>(
        builder: (context, state) => Scaffold(
              body: CarouselSlider(
                carouselController: ctrlCarousel,
                options: CarouselOptions(
                    height: double.infinity,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    reverse: false,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.5,
                    scrollDirection: Axis.horizontal,
                    animateToClosest: true,
                    scrollPhysics: const ScrollPhysics(
                        parent: NeverScrollableScrollPhysics())),
                items: [0, 1]
                    .map((i) => Builder(
                        builder: (BuildContext context) =>
                            buildSection(context, i)))
                    .toList(),
              ),
              backgroundColor: const Color(0xFF0D0D0D),
            ));
  }
}

Map<String, TextStyle> textStyles = {
  "headline": const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 22,
    fontFamily: "BentonSans-Bold",
  ),
  "subHeadline": const TextStyle(
    color: Colors.white,
    fontFamily: "BentonSans-Regular",
  ),
  "button": const TextStyle(
      color: Colors.white, fontSize: 16, fontFamily: "BentonSans-Black"),
};
