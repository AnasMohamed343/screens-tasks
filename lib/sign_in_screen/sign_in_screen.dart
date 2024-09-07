import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../db_sqlflite/database_helper.dart';
import 'custom_text_form_field.dart';
import 'isvalid_email.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController firstNameController =
      TextEditingController(text: 'anasss');

  TextEditingController lastNameController =
      TextEditingController(text: 'mohamed');

  TextEditingController emailController =
      TextEditingController(text: '3VJfG@example.com');

  TextEditingController passwordController =
      TextEditingController(text: '123456');

  TextEditingController confirmPasswordController =
      TextEditingController(text: '123456');

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Sign Up'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Icon(
                Icons.dark_mode,
                color: Colors.white,
              ),
            ),
          ]),
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          // keyboardDismissBehavior:
          //     ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: firstNameController,
                        labelText: 'first name',
                        keyboardType: TextInputType.text,
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'Plz,,, Enter first Name';
                          }
                          if (input.length < 6) {
                            return 'Error, first name must be at least 6 chars';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    Expanded(
                      child: CustomTextFormField(
                        controller: lastNameController,
                        labelText: 'last name',
                        keyboardType: TextInputType.text,
                        validator: (input) {
                          if (input == null || input.trim().isEmpty) {
                            return 'Plz,,, Enter last Name';
                          }
                          // if(input.length > 10){
                          //   return 'Error, user name cannot be more than 10 chars';
                          // }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  controller: emailController,
                  labelText: 'email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      //must make this condition(input == null) first because, the object(input) is nullable
                      return 'Plz,,, Enter e-mail address';
                    }
                    if (!isValidEmail(input)) {
                      return 'E-mail bad format';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  controller: passwordController,
                  labelText: 'password',
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  // isObscureText: true,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      //must make this condition(input == null) first because, the object(input) is nullable
                      return 'Plz,,, Enter password';
                    }
                    if (input.length < 6) {
                      return 'Password must be at least 6 chars';
                    }
                    return null; // by default returns null
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  controller: confirmPasswordController,
                  labelText: 'confirm password',
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  // isObscureText: true,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      //must make this condition(input == null) first because, the object(input) is nullable
                      return 'Plz,,, Enter password';
                    }
                    if (input != passwordController.text) {
                      return 'Password not match';
                    }
                    return null; // by default returns null
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueGrey),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      fixedSize: MaterialStateProperty.all<Size>(Size(100, 40)),
                    ),
                    onPressed: () {
                      signUp();
                    },
                    child: Text('Sign-Up')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      final user = User(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      await DatabaseHelper.insertUser(user);
      print("Sign Up Success");
      print(
          '{firstName: ${firstNameController.text}, lastName: ${lastNameController.text}, email: ${emailController.text}, password: ${passwordController.text}}');
      //Navigator.pop(context);
    }
  }
}
