import 'package:flutter/material.dart';

import '../components/input_component.dart';
import '../controller/custom_text_input_controller.dart';
import '../main.dart';
import '../utilities/text_input_options.dart';

class MainScreen extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Custom TextInput',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: buildForm(context),
        ),
      ),
    );
  }

  Form buildForm(BuildContext context) {
    CustomTextInputOptions nameInputOptions = CustomTextInputOptions(
      hintText: 'Enter User name',
      inputType: InputType.Default,
      enableBorder: true,
      themeColor: Theme.of(context).primaryColor,
      cornerRadius: 48.0,
      maxLength: 24,
      prefixIcon: Icon(Icons.person, color: Theme.of(context).primaryColor),
      textColor: Colors.black,
      errorMessage: 'User name cannot be empty',
      labelText: 'User Name',
    );

    CustomTextInputOptions phoneInputOptions = CustomTextInputOptions(
      hintText: 'Enter Number',
      inputType: InputType.Number,
      enableBorder: true,
      cornerRadius: 48.0,
      maxLength: 10,
    );

    CustomTextInputOptions paymentInputOptions = CustomTextInputOptions(
      hintText: 'Enter Card Number',
      inputType: InputType.PaymentCard,
      enableBorder: true,
      cornerRadius: 48.0,
      maxLength: 10,
    );

    CustomTextInputOptions emailInputOptions = CustomTextInputOptions(
      hintText: 'Enter Email',
      inputType: InputType.Email,
      enableBorder: true,
      cornerRadius: 48.0,
      maxLength: 24,
    );

    CustomTextInputOptions passwordInputOptions = CustomTextInputOptions(
      hintText: 'Enter Password',
      inputType: InputType.Password,
      enableBorder: true,
      cornerRadius: 48.0,
      maxLength: 16,
      prefixIcon: Icon(Icons.lock, color: Theme.of(context).primaryColor),
    );

    final CustomTextInputController nameController = CustomTextInputController(
      //textEditingController: TextEditingController(),
      options: nameInputOptions,
      context: context,
      updateState: () {
        setState(() {}); // Update the state of MainScreen when called
      },
    );

    final CustomTextInputController phoneController = CustomTextInputController(
      //textEditingController: TextEditingController(),
      options: phoneInputOptions,
      context: context,
      updateState: () {
        setState(() {}); // Update the state of MainScreen when called
      },
    );

    final CustomTextInputController emailController = CustomTextInputController(
      //textEditingController: TextEditingController(),
      options: emailInputOptions,
      context: context,
      updateState: () {
        setState(() {}); // Update the state of MainScreen when called
      },
    );

    final CustomTextInputController passwordController = CustomTextInputController(
      //textEditingController: TextEditingController(),
      options: passwordInputOptions,
      context: context,
      updateState: () {
        setState(() {}); // Update the state of MainScreen when called
      },
    );

    final CustomTextInputController paymentController = CustomTextInputController(
      //textEditingController: TextEditingController(),
      options: paymentInputOptions,
      context: context,
      updateState: () {
        setState(() {}); // Update the state of MainScreen when called
      },
    );


    return Form(
      child: Column(
        children: [
          CustomTextInput(
            controller: nameController
          ),
          CustomTextInput(
            controller: phoneController,
          ),
          ElevatedButton(
            onPressed: () {
              // Handle form submission here
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
