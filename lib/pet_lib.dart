library pet_lib;

import 'package:flutter/material.dart';
import 'package:pet_lib/tutorial_main_screen.dart';

import 'data_tutorial.dart';

class Tutorial {
  DataTutorial dataTutorial;
  Tutorial({required this.dataTutorial});

  Widget getTutorial() =>  TutorialMainScreen(dataTutorial: dataTutorial,);
}
