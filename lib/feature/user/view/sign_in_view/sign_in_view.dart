import 'package:firebase_login/feature/user/view/sign_up_view/sign_up_view.dart';
import 'package:flutter/material.dart';
import '../../../../product/widgets/custom_text_form_field_widget.dart';
import '../../view_model/user_view_model.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserViewModel userViewModel = UserViewModel();
    return SafeArea(
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomTextFormFieldWidget(
            controller: userViewModel.emailController,
            labelText: "email",
            hintText: "email",
            radius: 20,
          ),
          CustomTextFormFieldWidget(
            controller: userViewModel.passwordController,
            labelText: "password",
            hintText: "pasword",
            radius: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                await userViewModel.signIn().then((value) {
                  if (value!.email != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpView()));
                  }
                });
              },
              child: const Text("Sign In")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpView()));
              },
              child: const Text("Sign Up"))
        ]),
      ),
    );
  }
}
