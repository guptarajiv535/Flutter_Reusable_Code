import 'package:flutter/material.dart';

import '../controller/custom_text_input_controller.dart';

class CustomTextInput extends StatefulWidget {

  final CustomTextInputController controller;


  const CustomTextInput({
    Key? key,
    required this.controller,
  }) : super(key: key);


  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {

  @override
  void dispose() {
    // Dispose the TextEditingController when the widget is removed from the tree
    widget.controller.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: TextField(
        controller: widget.controller.textEditingController,
        decoration: InputDecoration(
          hintText: widget.controller.options.hintText,
          errorText: widget.controller.isValidate ? null : widget.controller
              .validationMessage,
          counterText: '',
          border: widget.controller.getBorder(),
          enabledBorder: widget.controller.options.enableBorder ? widget
              .controller.getBorder() : InputBorder
              .none,
          focusedBorder: widget.controller.options.enableBorder ? widget
              .controller.getBorder() : InputBorder
              .none,
          labelText: widget.controller.options.labelText ??
              widget.controller.options.hintText,
          labelStyle: widget.controller.getTextStyle(),
          prefixIcon: widget.controller.options.prefixIcon ??
              widget.controller.getPrefixIcon(),
          suffixIcon: widget.controller.getSuffixIcon(),
        ),
        onChanged: (textFieldValue) {
          widget.controller.checkValidation(textFieldValue);
          // widget.controller
          //     .updateState(); // Call the callback function to trigger a rebuild
        },
        keyboardType: widget.controller.getInputType(),
        obscureText: widget.controller.options.inputType ==
            InputType.Password &&
            !widget.controller.visibility,
        maxLength: widget.controller.options.inputType == InputType.PaymentCard
            ? 19
            : widget.controller.options.maxLength ??
            widget.controller.getMaxLength(),
        style: TextStyle(
          color: widget.controller.options.textColor ?? Colors.black,
        ),
        inputFormatters: [widget.controller.getFormatter()],
      ),
    );
  }
}