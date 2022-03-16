import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../product/widgets/custom_text_form_field_widget.dart';
import '../../view_model/user_view_model.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserViewModel userViewModel = UserViewModel();
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormFieldWidget(
              controller: userViewModel.usernameController,
              labelText: "username",
              hintText: "username",
              radius: 20,
            ),
            const SizedBox(height: 7),
            CustomTextFormFieldWidget(
              controller: userViewModel.emailController,
              labelText: "email",
              hintText: "email",
              radius: 20,
            ),
            const SizedBox(height: 7),
            CustomTextFormFieldWidget(
              controller: userViewModel.passwordController,
              labelText: "password",
              hintText: "password",
              radius: 20,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () async {
                  await userViewModel.signUp();
                  print("Tıklandı");
                },
                child: const Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
