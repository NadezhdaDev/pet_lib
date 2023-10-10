import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_lib/tutorial_base_screen_state.dart';

class TutorialWelcomeScreen extends TutorialBaseScreenState {
  final subtitleFontSize = 16.0;


  TutorialWelcomeScreen({required super.tutorialPageController,required super.dataTutorial});

  @override
  String title(BuildContext context) {
    return dataTutorial.startPageTitle;
  }

  @override
  Text subtitle(BuildContext context) {
    return Text(
      dataTutorial.startPageSubtitle??'',
      style: TextStyle(
        fontSize: subtitleFontSize,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget animationWidget() {
    return SizedBox(
      child: Lottie.asset(
        'assets/lottie/photo_screen_lottie.json',
        repeat: true,
      ),
    );
  }

  @override
  int getPage() {
    return 0;
  }
}
