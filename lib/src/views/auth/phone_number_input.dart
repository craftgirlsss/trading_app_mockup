import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valbury_mockup/src/components/appbars/default_appbar.dart';
import 'package:valbury_mockup/src/components/buttons/global_buttons.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';
import 'package:valbury_mockup/src/components/textfields/phone_text_field.dart';
import 'package:valbury_mockup/src/helpers/theme/annotated_region.dart';
import 'package:valbury_mockup/src/helpers/variable/global_variable.dart';
import 'package:valbury_mockup/src/views/auth/otp_page.dart';

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({super.key});

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var countryCode = ''.obs;
  var isLoading = false.obs;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return defaultAnnotatedRegion(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: GlobalVariableColors.primaryColor,
          appBar: GlobalAppBar.defaultAppBar(title: "Welcome to ${GlobalDefaultText.appName}", iconColor: Colors.white, actions: <Widget>[
            CupertinoButton(
              onPressed: (){}, child: const Icon(Icons.info, color: Colors.white)
            )
          ]),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Masukkan nomor HP kamu", style: GlobalTextStyle.defaultTextStyle(fontSize: 18, color: Colors.white)),
                  const SizedBox(height: 10),
                  Text("Kamu dapat login atau buat akun jika kamu pertama kali menggunakan aplikasi ${GlobalDefaultText.appName}", style: GlobalTextStyle.defaultTextStyle(color: Colors.white)),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => isLoading.value ? Container() : CountryCodePicker(
                        onChanged: (value) {
                          countryCode.value = value.dialCode!;
                        },
                        onInit: (value) {
                          countryCode.value = value!.dialCode!;
                        },
                        textStyle: GlobalTextStyle.defaultTextStyle(color: Colors.white),
                        initialSelection: 'ID',
                        hideSearch: true,
                        showFlagMain: true,
                        favorite: const ['+62', 'ID'],
                        flagDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7)),
                        ),
                      ),
                      Expanded(
                        child: PhoneTextField(
                          controller: controller,
                          formKey: _formKey,
                        )
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(30),
            child: GlobalButtons.defaultOutlinedButton(
              onPressed: (){
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Processing Data', style: GlobalTextStyle.defaultTextStyle()), backgroundColor: Colors.white),
                  );
                  Future.delayed(const Duration(seconds: 2), (){
                    Get.to(() => OtpPage(phone: countryCode.value+controller.text));
                  });
                }
              },
            ),
          ),
        ),
      )
    );
  }
}