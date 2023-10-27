import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utilities/masked_input_formatter.dart';
import '../utilities/text_input_options.dart';

class CustomTextInput extends StatefulWidget {

  final TextEditingController controller ;
  final CustomTextInputOptions options;


  const CustomTextInput(
      {super.key,
      required this.controller,
      required this.options
      });


  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  bool _isValidate = true;
  String validationMessage = '';
  bool visibility = false;
  int oldTextSize = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.options.hintText,
          errorText: _isValidate ? null : validationMessage,
          counterText: '',
          border: getBorder(),
          enabledBorder: widget.options.enableBorder ? getBorder() : InputBorder.none,
          focusedBorder: widget.options.enableBorder ? getBorder() : InputBorder.none,
          labelText: widget.options.labelText ?? widget.options.hintText,
          labelStyle: getTextStyle(),
          prefixIcon: widget.options.prefixIcon ?? getPrefixIcon(),
          suffixIcon: getSuffixIcon(),
        ),
        onChanged: checkValidation,
        keyboardType: getInputType(),
        obscureText: widget.options.inputType == InputType.Password && !visibility,
        maxLength: widget.options.inputType == InputType.PaymentCard
            ? 19
            : widget.options.maxLength ?? getMaxLength(),
        style: TextStyle(
          color: widget.options.textColor ?? Colors.black,
        ),
        inputFormatters: [getFormatter()],
      ),
    );
  }

  //get border of textinput filed
  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(widget.options.cornerRadius ?? 12.0)),
      borderSide: BorderSide(
          width: 2, color: widget.options.themeColor ?? Theme.of(context).primaryColor),
      gapPadding: 2,
    );
  }

  // formatter on basis of textinput type
  TextInputFormatter getFormatter() {
    if (widget.options.inputType == InputType.PaymentCard) {
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
        color: widget.options.themeColor ?? Theme.of(context).primaryColor);
  }

  // input validations
  void checkValidation(String textFieldValue) {
    if (widget.options.inputType == InputType.Default) {
      //default
      _isValidate = textFieldValue.isNotEmpty;
      validationMessage = widget.options.errorMessage ?? 'Filed cannot be empty';
    } else if (widget.options.inputType == InputType.Email) {
      //email validation
      _isValidate = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(textFieldValue);
      validationMessage = widget.options.errorMessage ?? 'Email is not valid';
    } else if (widget.options.inputType == InputType.Number) {
      //contact number validation
      _isValidate = textFieldValue.length == widget.options.maxLength;
      validationMessage = widget.options.errorMessage ?? 'Contact Number is not valid';
    } else if (widget.options.inputType == InputType.Password) {
      //password validation
      _isValidate = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(textFieldValue);
      validationMessage = widget.options.errorMessage ?? 'Password is not valid';
    } else if (widget.options.inputType == InputType.PaymentCard) {
      //payment card validation
      _isValidate = textFieldValue.length == 19;
      validationMessage = widget.options.errorMessage ?? 'Card number is not correct';
    }
    oldTextSize = textFieldValue.length;
    //change value in state
    setState(() {});
  }

  // return input type for setting keyboard
  TextInputType getInputType() {
    switch (widget.options.inputType) {
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
    switch (widget.options.inputType) {
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
    switch (widget.options.inputType) {
      case InputType.Default:
        return Icon(
          Icons.person,
          color: widget.options.themeColor ?? Theme.of(context).primaryColor,
        );
        break;

      case InputType.Email:
        return Icon(
          Icons.email,
          color: widget.options.themeColor ?? Theme.of(context).primaryColor,
        );
        break;

      case InputType.Number:
        return Icon(
          Icons.phone,
          color: widget.options.themeColor ?? Theme.of(context).primaryColor,
        );
        break;

      case InputType.Password:
        return Icon(
          Icons.lock,
          color: widget.options.themeColor ?? Theme.of(context).primaryColor,
        );
        break;

      case InputType.PaymentCard:
        return Icon(
          Icons.credit_card,
          color: widget.options.themeColor ?? Theme.of(context).primaryColor,
        );
        break;

      default:
        return Icon(
          Icons.person,
          color: widget.options.themeColor ?? Theme.of(context).primaryColor,
        );
        break;
    }
  }

  // get suffix icon
  Widget getSuffixIcon() {
    if (widget.options.inputType == InputType.Password) {
      return IconButton(
        onPressed: () {
          visibility = !visibility;
          setState(() {});
        },
        icon: Icon(
          visibility ? Icons.visibility : Icons.visibility_off,
          color: widget.options.themeColor ?? Theme.of(context).primaryColor,
        ),
      );
    } else {
      return const Opacity(opacity: 0, child: Icon(Icons.phone));
    }
  }
}

//input types
enum InputType { Default, Email, Number, Password, PaymentCard }
