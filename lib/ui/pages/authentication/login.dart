import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../controller/auth_controller.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final dateInput = TextEditingController();
  AuthenticationController authenticationController = Get.find();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  _login(theEmail, thePassword) async {
    logInfo('_login $theEmail $thePassword');
    try {
      await authenticationController.login(theEmail, thePassword);
    } catch (err) {
      Get.snackbar(
        "Login",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 12.0),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Login with your credentials",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                key: const Key('TextFormFieldemail'),
                controller: controllerEmail,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                key: const Key('TextFormFieldpassword'),
                controller: controllerPassword,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                  key: const Key('ButtonLoginSubmit'),
                  onPressed: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final form = _formKey.currentState;
                    form!.save();
                    if (_formKey.currentState!.validate()) {
                      await _login(
                          controllerEmail.text, controllerPassword.text);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                  key: const Key('Buttoncreateaccount'),
                  onPressed: () {
                    Get.to(const SignUpPage(
                      key: Key('SignUpPage'),
                    ));
                  },
                  child: const Text('Sign Up'),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
