class DataTutorial{
  final String startPageTitle;
  final Function() finishTutorialFunction;
  final String? startPageSubtitle;
  final String? nextButtonLabel;
  final String? videoPageTitle;
  final String? videoPageSubtitle;
  final String? endPageTitle;
  final String? endPageSubtitle;
  DataTutorial({
    required this.startPageTitle,
    required this.finishTutorialFunction,
    this.endPageSubtitle,
    this.endPageTitle,
    this.nextButtonLabel,
    this.startPageSubtitle,
    this.videoPageSubtitle,
    this.videoPageTitle,
  });
}