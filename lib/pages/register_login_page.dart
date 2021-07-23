import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tinder_ayacucho/controllers/register_login_controller.dart';

class RegisterLoginPage extends StatelessWidget {
  //const RegisterLoginPage({ Key? key }) : super(key: key);
  final controller = Get.put(LoginRegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginRegisterController>(
        builder: (_) {
          return Form(
              child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (String? value) {
                      if (value!.isEmpty) return 'Please enter some text';
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (String? value) {
                      if (value!.isEmpty)
                        return 'Please enter some text or number';
                      return null;
                    },
                    obscureText: true,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 16.0),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      child: Text('Register'),
                      onPressed: () async {
                        _.register();
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(controller.success == null
                        ? ''
                        : (controller.success
                            ? 'Successfully registered' + controller.userEmail
                            : 'Registration failed')),
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
