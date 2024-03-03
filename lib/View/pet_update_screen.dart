import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:openapi_demo/ViewModel/pet_view_model.dart';

class PetUpdateScreen extends StatefulWidget {
  final String petName;
  final String petID;
  const PetUpdateScreen({super.key, required this.petName, required this.petID});

  @override
  State<PetUpdateScreen> createState() => _PetUpdateScreenState();
}

class _PetUpdateScreenState extends State<PetUpdateScreen> {

  TextEditingController updatePetName = TextEditingController();
  TextEditingController updatePetId = TextEditingController();
  final petViewModel = Get.find<PetViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updatePetName.text = widget.petName;
    updatePetId.text = widget.petID;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
       child: Column(
          children: [
            TextField(
              controller: updatePetName,
            ),
            SizedBox(height: 10,),
            TextField(
              controller: updatePetId,
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: () {
              petViewModel.updatePetData(updatePetName.text, int.parse(updatePetId.text));
            }, child: Text('Update Data'))
          ],
        ),
      ),
    );
  }
}
