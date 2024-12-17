import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:valbury_mockup/src/components/appbars/default_appbar.dart';
import 'package:valbury_mockup/src/components/buttons/global_buttons.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';
import 'package:valbury_mockup/src/helpers/theme/annotated_region.dart';
import 'package:valbury_mockup/src/helpers/variable/global_variable.dart';
import 'package:valbury_mockup/src/views/mainpage.dart';

class PasscodePage extends StatefulWidget {
  const PasscodePage({super.key});

  @override
  State<PasscodePage> createState() => _PasscodePageState();
}

class _PasscodePageState extends State<PasscodePage> {
  
  String? passcode;
  var isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return defaultAnnotatedRegion(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: GlobalVariableColors.primaryColor,
          appBar: GlobalAppBar.defaultAppBar(
            title: "Passcode",
            iconColor: Colors.white
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Text("Masukkan PIN Anda", style: GlobalTextStyle.defaultTextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  OtpTextField(
                    keyboardType: TextInputType.number,
                    numberOfFields: 6,
                    borderColor: Colors.white,
                    cursorColor: Colors.white,
                    focusedBorderColor: Colors.white,
                    textStyle: GlobalTextStyle.defaultTextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
                    showFieldAsBox: false,
                    borderWidth: 4.0,
                    onCodeChanged: (String code) {
                    },
                    onSubmit: (String verificationCode) {
                      setState(() {
                        passcode = verificationCode;
                      });
                    }, 
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Lupa PIN Anda?", style: GlobalTextStyle.defaultTextStyle(color: Colors.white)),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: Text('  Atur Ulang', style: GlobalTextStyle.defaultTextStyle(color: Colors.white, fontWeight: FontWeight.bold)), onPressed: (){})
                    ],
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(30),
            child: Obx(
              () => GlobalButtons.defaultOutlinedButton(
                onPressed: isLoading.value ? null : (){
                  Get.offAll(() => const Mainpage());
                },
              ),
            ),
          ),
        ),
      )
    );
  }
}