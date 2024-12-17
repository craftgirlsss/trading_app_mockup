import 'package:flutter/material.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final GlobalKey<FormState>? formKey;
  final bool? readOnly;
  const CustomTextFormField({super.key, this.controller, this.hintText, this.keyboardType, this.formKey, this.readOnly});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        controller: widget.controller,
        readOnly: widget.readOnly ?? false,
        keyboardType: widget.keyboardType ?? TextInputType.name,
        style: GlobalTextStyle.defaultTextStyle(fontSize: 16),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter ${widget.hintText}';
          }
          return null;
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: "-",
          hintStyle: GlobalTextStyle.defaultTextStyle(fontSize: 13, color: Colors.black45),
          labelStyle: GlobalTextStyle.defaultTextStyle(fontSize: 11, color: Colors.black45),
          label: Text(widget.hintText ?? "Label"),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 0.5)
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 0.5)
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 0.5)
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 0.5)
          ),
        ),
      )
    );
  }
}