import 'package:math_opera/ui/pages/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _nacimientoController = TextEditingController();
  final _cursoController = TextEditingController();
  final _colegioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Primera vez?"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 12.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Ingresa los siguientes datos',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: const Key('TextFormFieldcreauser'),
                  controller: _userController,
                  decoration: const InputDecoration(labelText: 'Usuario'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Ingresa Usuario Nuevo";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: const Key('TextFormFieldcrea'),
                  controller: _nacimientoController,
                  decoration:
                      const InputDecoration(labelText: 'Fecha de nacimiento'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Ingresa fecha nacimiento";
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: const Key('TextFormFieldSignUpCurso'),
                  controller: _cursoController,
                  decoration: const InputDecoration(labelText: "Curso"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Ingresa grado";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: const Key('TextFormFieldSignUpColegio'),
                  controller: _colegioController,
                  decoration: const InputDecoration(labelText: "Colegio"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Ingresa Colegio";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                    key: const Key('ButtonSignUpSubmit'),
                    onPressed: () {
                      // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                      FocusScope.of(context).requestFocus(FocusNode());
                      final form = _formKey.currentState;
                      form!.save();
                      if (form.validate()) {
                        Get.to(LoginScreen(
                          key: const Key('LoginScreen'),
                          user: _userController.text,
                        ));
                      } else {
                        const snackBar = SnackBar(
                          content: Text('Validation nok'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
