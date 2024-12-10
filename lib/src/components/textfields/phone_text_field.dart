import 'package:flutter/material.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';

class PhoneTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final GlobalKey<FormState>? formKey;

  const PhoneTextField({super.key, this.controller, this.formKey, this.hintText, this.keyboardType});

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        maxLength: 13,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter phone number';
          }
          return null;
        },
        keyboardType: widget.keyboardType ?? TextInputType.phone,
        cursorColor: Colors.white,
        style: GlobalTextStyle.defaultTextStyle(color: Colors.white),
        decoration: InputDecoration(
          counterStyle: GlobalTextStyle.defaultTextStyle(color: Colors.white, fontSize: 10),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintStyle: const TextStyle(color: Colors.white),
          hintText: widget.hintText ?? "81xxxx",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white38)
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.red)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white38)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white)
          )
        ),
      ),
    );
  }
}