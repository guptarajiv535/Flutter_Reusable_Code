import 'package:flutter/material.dart';

import '../components/input_component.dart';
import '../controller/custom_text_input_controller.dart';

class CustomTextInputOptions {

  final String hintText;
  final InputType inputType;
  final bool enableBorder;
  final Color? themeColor;
  final double? cornerRadius;
  final int? maxLength;
  final Widget? prefixIcon;
  final String? errorMessage;
  final String? labelText;
  final Color? textColor;

  CustomTextInputOptions({
    required this.hintText,
    required this.inputType,
    this.enableBorder = true,
    this.themeColor,
    this.cornerRadius,
    this.maxLength,
    this.prefixIcon,
    this.textColor,
    this.errorMessage,
    this.labelText
  });
}
