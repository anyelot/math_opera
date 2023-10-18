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
                "Math Operations",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Ingrese sus datos",
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
                decoration: const InputDecoration(labelText: 'Contraseña'),
              ),
              const SizedBox(
                height: 20,
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
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.blue[700],
                    ),
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.fromLTRB(30, 15, 30, 15),
                    ),
                  ),
                  child: const Text(
                    'Ingreso',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextButton(
                  key: const Key('Buttoncreateaccount'),
                  onPressed: () {
                    Get.to(const SignUpPage(
                      key: Key('SignUpPage'),
                    ));
                  },
                  child: const Text('Registrate'),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
