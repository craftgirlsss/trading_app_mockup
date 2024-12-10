import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valbury_mockup/src/helpers/theme/annotated_region.dart';
import 'package:valbury_mockup/src/views/introduction/index.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  bool opacity = false;
  
  @override
  void initState() {
    super.initState();
    setState(() {
      opacity = true;
    });
    Future.delayed(const Duration(seconds: 4), (){
      setState(() {
        opacity = false;
      });
      Get.offAll(() => const IntroductionScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return defaultAnnotatedRegion(
      child: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(seconds: 1),
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: Image.asset('assets/images/background.jpg', fit: BoxFit.cover)),
              Center(
                child: Image.asset('assets/icons/ic_launcher.png', width: size.width / 2),
              )
            ],
          ),
        ),
      )
    );
  }
}