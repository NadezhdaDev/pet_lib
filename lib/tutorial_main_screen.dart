import 'package:flutter/material.dart';
import 'package:pet_lib/data_tutorial.dart';
import 'package:pet_lib/screen_state_factory.dart';
import 'package:pet_lib/tutorial_flexible_setting_screen.dart';
import 'package:pet_lib/tutorial_manage_your_project_screen.dart';
import 'package:pet_lib/tutorial_welcome_screen.dart';

class TutorialMainScreen extends StatefulWidget {
  final DataTutorial dataTutorial;

  const TutorialMainScreen({super.key, required this.dataTutorial});

  @override
  State<TutorialMainScreen> createState() => _TutorialMainScreenState();
}

class _TutorialMainScreenState extends State<TutorialMainScreen>
    with SingleTickerProviderStateMixin {
  final PageController tutorialPageController = PageController();

  @override
  void dispose() {
    tutorialPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: tutorialPageController,
      children:
          _getPages(tutorialPageController), //ignore:avoid-returning-widgets
    );
  }

  List<Widget> _getPages(PageController tutorialPageController) {
    return [
      ScreenStateFactory(
        stateFactory: () => TutorialWelcomeScreen(
            tutorialPageController: tutorialPageController,
            dataTutorial: widget.dataTutorial),
      ),
      ScreenStateFactory(
        stateFactory: () => TutorialVideoScreen(
          tutorialPageController: tutorialPageController,
          dataTutorial: widget.dataTutorial,
        ),
      ),
      ScreenStateFactory(
        stateFactory: () => TutorialEndScreen(
          tutorialPageController: tutorialPageController,
          dataTutorial: widget.dataTutorial,
        ),
      ),
    ];
  }
}
