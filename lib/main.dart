import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valbury_mockup/src/helpers/variable/global_variable.dart';
import 'package:valbury_mockup/src/views/introduction/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'All Media Indo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        buttonTheme: const ButtonThemeData(
          buttonColor: GlobalVariableColors.primaryColor
        )
      ),
      home: const Splashscreen(),
    );
  }
}