import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:project_1/controllers/user.dart';

Future<void> initDataStorage() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");
}

bool _parseBool(String? input) {
  input ??= 'false';
  if (input.toLowerCase() == 'true') return true;
  if (input.toLowerCase() == 'false') return false;
  throw FormatException('Invalid boolean string: $input');
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool hasAccount = _parseBool(Get.parameters['hasAccount']);
    return hasAccount ? LoginPage() : RegisterPage();
  }
}

class RegisterPage extends StatelessWidget {
  final controller = UserController();

  static final _bodyFormKey = GlobalKey<FormBuilderState>();
  Widget getForm() {
    return FormBuilder(
      key: _bodyFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5.0,
        children: [
          FormBuilderTextField(
            name: "username",
            decoration: InputDecoration(labelText: 'Username'),
          ),
          FormBuilderTextField(
            name: "password",
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5.0,
            children: [
              ElevatedButton(
                onPressed: null,
                child: const Text("Have an account?"),
              ),
              ElevatedButton(
                onPressed: registerOnPressed,
                child: const Text("Register"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void registerOnPressed() {
    if (_bodyFormKey.currentState!.saveAndValidate()) {
      controller.register(
        _bodyFormKey.currentState!.value['username'],
        _bodyFormKey.currentState!.value['password'],
      );
      print('what is love');
      Get.toNamed('/account?hasAccount=true');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register'), centerTitle: true),
      body: Padding(padding: const EdgeInsets.all(16.0), child: getForm()),
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }
}

class LoginPage extends StatelessWidget {
  Widget getBody() {
    return const Text('Login Form');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'), centerTitle: true),
      body: getBody(),
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text("Account");
  }
}
