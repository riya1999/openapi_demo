import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:openapi_demo/Binding/generalBinding.dart';
import 'View/petview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialBinding: GeneralBinding(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PetView());
  }
}

