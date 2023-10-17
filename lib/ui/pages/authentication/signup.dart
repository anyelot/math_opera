import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:loggy/loggy.dart';
import 'package:math_opera/db/some_data_1_db.dart';
import 'package:math_opera/ui/controller/auth_controller.dart';

import '../../../db/hive_data.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerPassword = TextEditingController();
  final _gradeController = TextEditingController();
  final _schoolController = TextEditingController();
  final dateInput = TextEditingController();
  AuthenticationController authenticationController = Get.find();

  final HiveData hivedata = const HiveData();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  _signUp(form) async {
    logInfo('_signUp $form');
    try {
      await authenticationController.signUp(form);
    } catch (err) {
      Get.snackbar(
        "signUp",
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
                "sign up with your credentials",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                key: const Key('TextFormFieldname'),
                controller: controllerName,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                key: const Key('TextFormFieldlastname'),
                controller: controllerLastName,
                decoration: const InputDecoration(labelText: 'LastName'),
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
              TextFormField(
                key: const Key('TextFormFieldBirthday'),
                controller: dateInput,
                //editing controller of this TextField
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
                    labelText: "Enter Birth date" //label text of field
                    ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2100));

                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate!);

                  setState(() {
                    dateInput.text = formattedDate;
                  });
                },
              ),
              TextFormField(
                key: const Key('TextFormFieldAge'),
                controller: _gradeController,
                decoration: const InputDecoration(labelText: 'Grade'),
              ),
              TextFormField(
                key: const Key('TextFormFieldSchool'),
                controller: _schoolController,
                decoration: const InputDecoration(labelText: 'School'),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                  key: const Key('ButtonSignUpSubmit'),
                  onPressed: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final form = _formKey.currentState;
                    form!.save();
                    if (_formKey.currentState!.validate()) {
                      var fromobjc = {
                        "firstName": controllerName.text,
                        "lastName": controllerLastName.text,
                        "email": controllerEmail.text,
                        "password": controllerPassword.text,
                        "birthday": dateInput.text,
                        "grade": _gradeController.text,
                        "school": _schoolController.text,
                      };
                      await _signUp(fromobjc);
                      await hivedata.saveUser2(SomeDataDb2(
                          email: controllerEmail.text,
                          password: controllerPassword.text,
                          school: _schoolController.text,
                          birthdate: dateInput.text,
                          grade: _gradeController.text));
                      Get.back();
                    }
                  },
                  child: const Text('Submit'),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
