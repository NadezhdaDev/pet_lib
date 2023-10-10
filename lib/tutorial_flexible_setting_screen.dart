import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_lib/tutorial_base_screen_state.dart';

class TutorialEndScreen extends TutorialBaseScreenState with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  final subtitleFontSize = 16.0;

  TutorialEndScreen({
    required super.tutorialPageController,
    required super.dataTutorial,
  });

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    super.initState();
  }

  @override
  String title(BuildContext context) {
    return dataTutorial.endPageTitle??'';
  }

  @override
  Text subtitle(BuildContext context) {
    return Text(
      dataTutorial.endPageSubtitle??'',
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
        controller: _animationController,
        repeat: true,
        onLoaded: (composition) {
          _animationController
            ..duration = composition.duration
            ..repeat();
        },
      ),
    );
  }

  @override
  void next() {
    dataTutorial.finishTutorialFunction();
  }

  @override
  int getPage() {
    return 2;
  }
}
