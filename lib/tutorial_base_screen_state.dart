import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:pet_lib/screen_state_factory.dart';

import 'data_tutorial.dart';

abstract class TutorialBaseScreenState extends State<ScreenStateFactory> {
  final PageController tutorialPageController;
  final _amountTutorialsScreen = 3;
  final DataTutorial dataTutorial;

  TutorialBaseScreenState({required this.tutorialPageController, required this.dataTutorial});

  @override
  Widget build(BuildContext context) {
    const titleFontSize = 24.0;
    const buttonNextFontSize = 17.0;
    const titleTopPadding = 16.0;
    const buttonNextBottomPadding = 20.0;
    const subtitleTopPadding = 12.0;
    const textHorizontalPadding = 24.0;
    const dotIndicatorTopPadding = 16.0;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: animationWidget(),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: titleTopPadding,
                  left: textHorizontalPadding,
                  right: textHorizontalPadding, //ignore:no-equal-arguments
                ),
                child: Text(
                  title(context),
                  style: const TextStyle(
                    fontSize: titleFontSize,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: subtitleTopPadding,
                  left: textHorizontalPadding,
                  right: textHorizontalPadding, //ignore:no-equal-arguments
                ),
                child: subtitle(context),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: dotIndicatorTopPadding),
            child: dotIndicator(),
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: buttonNextBottomPadding,
            ),
            child: TextButton(
              onPressed: () => next(),
              child: Text(
                dataTutorial.nextButtonLabel?? 'Next',
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: buttonNextFontSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget animationWidget();

  String title(BuildContext context);

  Text subtitle(BuildContext context);

  Widget dotIndicator() => DotsIndicator(
        dotsCount: _amountTutorialsScreen,
        position: getPage(),
        decorator: const DotsDecorator(
          color: Colors.green,
          activeColor: Colors.blue,
          spacing: EdgeInsets.all(8.0),
        ),
      );

  void next() => tutorialPageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);

  int getPage();
}
