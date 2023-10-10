import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_lib/tutorial_base_screen_state.dart';
import 'package:video_player/video_player.dart';



class TutorialVideoScreen extends TutorialBaseScreenState {
  late final VideoPlayerController _videoControllerManageYourProject;
  final subtitleFontSize = 16.0;

  TutorialVideoScreen({
    required super.tutorialPageController,
    required super.dataTutorial
  });

  @override
  void initState() {
    _videoControllerManageYourProject = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))..setLooping(true)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {_videoControllerManageYourProject.play();});
      });
    super.initState();
  }


  @override
  void dispose() {
    _videoControllerManageYourProject.dispose();
    // TODO: implement dispose
    super.dispose();
  }


  @override
  String title(BuildContext context) {
    return dataTutorial.videoPageTitle??"";
  }

  @override
  Text subtitle(BuildContext context) {
    return Text(
      dataTutorial.videoPageSubtitle??'',
      style: TextStyle(
        fontSize: subtitleFontSize,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget animationWidget() {

    return Container(
      child: _videoControllerManageYourProject.value.isInitialized
          ? AspectRatio(
        aspectRatio: _videoControllerManageYourProject.value.aspectRatio,
        child: VideoPlayer(_videoControllerManageYourProject),
      )
          : Container(),
    );

  }

  @override
  int getPage() {
    return 1; //ignore:no-magic-number
  }
}
