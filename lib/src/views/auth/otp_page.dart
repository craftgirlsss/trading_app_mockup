import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:valbury_mockup/src/components/appbars/default_appbar.dart';
import 'package:valbury_mockup/src/components/buttons/global_buttons.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';
import 'package:valbury_mockup/src/helpers/theme/annotated_region.dart';
import 'package:valbury_mockup/src/helpers/variable/global_variable.dart';
import 'package:valbury_mockup/src/views/auth/pin_page.dart';

class OtpPage extends StatefulWidget {
  final String? phone;
  const OtpPage({super.key, this.phone});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  var countdowntime = 60.obs;
  var isLoading = false.obs;
  String? otp;
  Timer? _timer;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (countdowntime.value == 0) {
          timer.cancel();
        } else {
          countdowntime.value--;
        }
      },
    );
  }

  @override
    void initState() {
      super.initState();
      Future.delayed(const Duration(seconds: 2), () => startTimer());
    }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return defaultAnnotatedRegion(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: GlobalVariableColors.primaryColor,
          appBar: GlobalAppBar.defaultAppBar(
            iconColor: Colors.white,
            title: "OTP Verification",
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/otps.png'),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Masukkan 4 digit kode verifikasi yang dikirim ke nomor WhatsApp ',
                      style: GlobalTextStyle.defaultTextStyle(color: Colors.white, fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(text: '${widget.phone ?? 0}', style: GlobalTextStyle.defaultTextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  OtpTextField(
                    keyboardType: TextInputType.number,
                    numberOfFields: 5,
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
                        otp = verificationCode;
                      });
                    }, 
                  ),
                  const SizedBox(height: 40),
                  Obx(() {
                    return Text("Mohon tunggu ${countdowntime.value} detik untuk mengirim ulang kode melalui WhatsApp OTP", style: GlobalTextStyle.defaultTextStyle(color: Colors.white), textAlign: TextAlign.center);
                  })
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(30),
            child: Obx(
              () => GlobalButtons.defaultOutlinedButton(
                onPressed: countdowntime.value > 0 ? (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Berhasil", style: GlobalTextStyle.defaultTextStyle()), backgroundColor: Colors.white),
                  );
                  Future.delayed(const Duration(seconds: 2), (){
                    Get.to(() => const PasscodePage());
                  });
                } : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}