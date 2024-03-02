import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:openapi/openapi.dart';

class PetViewModel extends GetxController {
  RxBool isLoading = true.obs;
  var petList = <Pet>[].obs;
  var onError = false.obs;
  PetApi? response;

  @override
  void onInit() {
    super.onInit();
    getUserList();
  }

  Future<void> getUserList() async {
    response = PetApi(
        Dio(BaseOptions(baseUrl: 'https://petstore3.swagger.io/api/v3')),
        standardSerializers);
    final responseData = await response?.findPetsByStatus(status: 'available');
    if (responseData?.statusCode == 200) {
      isLoading.value = false;
      print('REDIREDCTS ${responseData?.redirects}');
      print('DATS ${responseData?.data}');
      final petData = responseData?.data;
      petList.addAll(petData!);
    }
  }

  Future<void> updatePetData(String petName, int petID) async {
    try {
      response = PetApi(
          Dio(BaseOptions(baseUrl: 'https://petstore3.swagger.io/api/v3')),
          standardSerializers);
      final responseData = await response?.updatePet(pet: Pet(
        (b) {
          b.name = petName;
        },
      ));

      if (responseData?.statusCode == 200) {
        print('RESPONSE ${responseData?.data}');
        //Get.back(result: responseData?.data);
      } else {
        print('Unexpected status code: ${responseData?.statusCode}');
      }
    } on DioError catch (e) {
      // Handle DioError specifically for Dio exceptions
      if (e.response != null) {
        // The server responded, but with an error status code
        print('Server error - status code: ${e.response!.statusCode}');
        print('Server error - response data: ${e.response!.data}');
        // Handle the error appropriately, e.g., show an error message to the user
      } else {
        print('Error sending request: $e');
        // Handle the error appropriately, e.g., show an error message to the user
      }
    } catch (e) {
      // Handle other potential errors
      print('Error updating pet: $e');
      // Handle the error appropriately, e.g., show an error message to the user
    }
  }
}
