/*

import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.petApi});

  final String title;
  final PetApi petApi;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  void _loadData() async {
    try {
      final pet = await widget.petApi.getPetById(petId: 1);
      final pet1 = await widget.petApi.findPetsByStatus(status: 'available');

      // print(pet);
      print(pet1.data![1].name);
    } catch (e) {
      print('Error loading pet data: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadData,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openapi/openapi.dart';
import 'package:openapi_demo/View/pet_update_screen.dart';
import 'package:openapi_demo/ViewModel/pet_view_model.dart';

import '../Utils/custom_list_tile.dart';

class PetView extends StatefulWidget {
  const PetView({super.key});

  @override
  State<PetView> createState() => _PetViewState();
}

class _PetViewState extends State<PetView> with WidgetsBindingObserver {
  final petViewModel = Get.find<PetViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => petViewModel.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: petViewModel.petList.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 5.0, top: 5.0),
                      child: GestureDetector(
                        onTap: () async {
                          // Wait for the result from PetUpdateScreen
                          Pet? updatedPet = await Get.to(
                                () => PetUpdateScreen(
                              petName: petViewModel.petList[index].name.toString(),
                              petID: petViewModel.petList[index].id.toString(),
                            ),
                          );

                          // If the result is not null, update the pet list
                          if (updatedPet != null) {
                            // Find the index of the updated pet in the list
                            int index = petViewModel.petList.indexWhere((pet) => pet.id == updatedPet.id);

                            if (index != -1) {
                              // Update the pet data in the list
                              petViewModel.petList[index] = updatedPet;
                            }
                          }
                        },
                        child: customListTile(
                            context,
                            petViewModel.petList[index].id.toString(),
                            petViewModel.petList[index].name.toString()),
                      ));
                }),
      ),
    );
  }
}
