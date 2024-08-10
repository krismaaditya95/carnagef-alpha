import 'package:get/get.dart';

class PopularController extends GetxController{

  var counter = 0.obs;
  final title = "Popular Movies";
  void incrementCounterGetX(){
    counter++;
  }
}