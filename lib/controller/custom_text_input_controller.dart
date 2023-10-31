//get border of textinput filed
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities/masked_input_formatter.dart';
import '../utilities/text_input_options.dart';

class CustomTextInputController {
  late final TextEditingController textEditingController;
  late final CustomTextInputOptions options;
  late final BuildContext context;

  final VoidCallback updateState; // Callback function to update the state

  bool isValidate = true;
  String validationMessage = '';
  bool visibility = false;
  int oldTextSize = 0;


  CustomTextInputController({
    required this.options,
    required this.context,
    required this.updateState,
  }) {
    textEditingController = TextEditingController();
  }

  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
          Radius.circular(options.cornerRadius ?? 12.0)),
      borderSide: BorderSide(
          width: 2,
          color: options.themeColor ?? Theme.of(context).primaryColor),
      gapPadding: 2,
    );
  }

// formatter on basis of textinput type
  TextInputFormatter getFormatter() {
    if (options.inputType == InputType.PaymentCard) {
      return MaskedTextInputFormatter(
        mask: 'xxxx xxxx xxxx xxxx',
        separator: ' ',
      );
    } else {
      return TextInputFormatter.withFunction((oldValue, newValue) => newValue);
    }
  }

// text style for textinput
  TextStyle getTextStyle() {
    return TextStyle(
        color: options.themeColor ?? Theme.of(context).primaryColor);
  }

// input validations
  void checkValidation(String textFieldValue) {
    if (options.inputType == InputType.Default) {
      //default
      isValidate = textFieldValue.isNotEmpty;
      validationMessage =
          options.errorMessage ?? 'Filed cannot be empty';
    } else if (options.inputType == InputType.Email) {
      //email validation
      isValidate = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(textFieldValue);
      validationMessage = options.errorMessage ?? 'Email is not valid';
    } else if (options.inputType == InputType.Number) {
      //contact number validation
      isValidate = textFieldValue.length == options.maxLength;
      validationMessage =
          options.errorMessage ?? 'Contact Number is not valid';
    } else if (options.inputType == InputType.Password) {
      //password validation
      isValidate = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(textFieldValue);
      validationMessage =
          options.errorMessage ?? 'Password is not valid';
    } else if (options.inputType == InputType.PaymentCard) {
      //payment card validation
      isValidate = textFieldValue.length == 19;
      validationMessage =
          options.errorMessage ?? 'Card number is not correct';
    }
    oldTextSize = textFieldValue.length;
    updateState();
  }

// return input type for setting keyboard
  TextInputType getInputType() {
    switch (options.inputType) {
      case InputType.Default:
        return TextInputType.text;
        break;

      case InputType.Email:
        return TextInputType.emailAddress;
        break;

      case InputType.Number:
        return TextInputType.number;
        break;

      case InputType.PaymentCard:
        return TextInputType.number;
        break;

      default:
        return TextInputType.text;
        break;
    }
  }

// get max length of text
  int getMaxLength() {
    switch (options.inputType) {
      case InputType.Default:
        return 36;
        break;

      case InputType.Email:
        return 36;
        break;

      case InputType.Number:
        return 10;
        break;

      case InputType.Password:
        return 24;
        break;

      case InputType.PaymentCard:
        return 19;
        break;

      default:
        return 36;
        break;
    }
  }

// get prefix Icon
  Icon getPrefixIcon() {
    switch (options.inputType) {
      case InputType.Default:
        return Icon(
          Icons.person,
          color: options.themeColor ?? Theme.of(context).primaryColor,
        );
        break;

      case InputType.Email:
        return Icon(
          Icons.email,
          color: options.themeColor ?? Theme.of(context).primaryColor,
        );
        break;

      case InputType.Number:
        return Icon(
          Icons.phone,
          color: options.themeColor ?? Theme.of(context).primaryColor,
        );
        break;

      case InputType.Password:
        return Icon(
          Icons.lock,
          color: options.themeColor ?? Theme.of(context).primaryColor,
        );
        break;

      case InputType.PaymentCard:
        return Icon(
          Icons.credit_card,
          color: options.themeColor ?? Theme.of(context).primaryColor,
        );
        break;

      default:
        return Icon(
          Icons.person,
          color: options.themeColor ?? Theme.of(context).primaryColor,
        );
        break;
    }
  }

// get suffix icon
  Widget getSuffixIcon() {
    if (options.inputType == InputType.Password) {
      return IconButton(
        onPressed: () {
          visibility = !visibility;
          updateState();
        },
        icon: Icon(
          visibility ? Icons.visibility : Icons.visibility_off,
          color: options.themeColor ?? Theme.of(context).primaryColor,
        ),
      );
    } else {
      return const Opacity(opacity: 0, child: Icon(Icons.phone));
    }
  }
}


//input types
enum InputType { Default, Email, Number, Password, PaymentCard }
