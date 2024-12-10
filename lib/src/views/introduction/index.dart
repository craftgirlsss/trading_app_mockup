import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valbury_mockup/src/components/buttons/global_buttons.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';
import 'package:valbury_mockup/src/helpers/theme/annotated_region.dart';
import 'package:valbury_mockup/src/helpers/variable/global_variable.dart';
import 'package:valbury_mockup/src/views/auth/phone_number_input.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    return defaultAnnotatedRegion(
      child: Scaffold(
        backgroundColor: GlobalVariableColors.backGroundColor,
        body: Stack(
          children: [
            Positioned(
              right: 0,
              top: 50,
              child: GlobalButtons.defaultCupertinoTextButton(onPressed: (){}, title: "Discover")),
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/intro.png'),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Investasi dan Trading di pasar market lebih mudah", style: GlobalTextStyle.defaultTextStyle(fontSize: 17, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(30),
          child: GlobalButtons.defaultCupertinoButton(
          onPressed: (){
            Get.to(() => const PhoneNumberInput());
          },
          title: "Masuk atau Daftar"
          ),
        ),
      )
    );
  }
}