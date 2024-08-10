import 'package:carnagef_alpha/features/movies/presentation/popular/getx/popular_controller.dart';
import 'package:get/get.dart';

class PopularBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(PopularController());
  }
}