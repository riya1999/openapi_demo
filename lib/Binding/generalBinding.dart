import 'package:get/get.dart';
import 'package:openapi_demo/ViewModel/pet_view_model.dart';

class GeneralBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(PetViewModel());
  }

}