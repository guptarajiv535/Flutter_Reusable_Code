import 'package:flutter/material.dart';

import '../components/input_component.dart';
import '../main.dart';
import '../utilities/text_input_options.dart';

class MainScreen extends  State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _paymentController = TextEditingController();


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
    ) ;

    CustomTextInputOptions passwordInputOptions = CustomTextInputOptions(
      hintText: 'Enter Password',
      inputType: InputType.Password,
      enableBorder: true,
      cornerRadius: 48.0,
      maxLength: 16,
      prefixIcon: Icon(Icons.lock, color: Theme.of(context).primaryColor),
    );

    return Form(
          child: Column(
            children: [
              CustomTextInput(
                controller: _nameController,
                options: nameInputOptions,
              ),
              CustomTextInput(
                controller: _phoneController,
                options: phoneInputOptions,
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
