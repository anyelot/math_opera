import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../content/home.dart';
import 'signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.user}) : super(key: key);

  final String user;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _cursoController = TextEditingController();
  final _colegioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 12.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Ingresa tu usuario",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: const Key('TextFormFieldLoginUser'),
                  controller: _userController,
                  decoration: const InputDecoration(labelText: 'User'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter user";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                    key: const Key('ButtonLoginSubmit'),
                    onPressed: () {
                      // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                      FocusScope.of(context).requestFocus(FocusNode());
                      final form = _formKey.currentState;
                      form!.save();
                      if (form.validate()) {
                        if (widget.user == _userController.text) {
                          Get.to(HomePage(
                            key: const Key('HomePage'),
                            loggedUser: _userController.text,
                          ));
                        } else {
                          Get.to(const SignUpPage(
                            key: Key('SignUpPage'),
                          ));
                        }
                      } else {
                        const snackBar = SnackBar(
                          content: Text('Validation nok'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text("Submit")),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
