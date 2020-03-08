import 'dart:ui';

class OnboardPageModel {

  final Color primaryColor;
  final Color accentColor;
  
  final int pageNumber;
  final String imagePath;
  final bool openbutton;
 
  final String subhead;
  final String description;

  OnboardPageModel(this.primaryColor, this.accentColor, this.pageNumber, this.imagePath, this.openbutton, this.subhead, this.description);

}