import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import 'package:twitter/common/custom_app_bar.dart';
import 'package:twitter/common/rounded_button.dart';
import 'package:twitter/feature/auth/widgets/auth_input_widget.dart';
import 'package:twitter/theme/pallete.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final appBar = CustomAppBar.build();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AuthInputWidget(
                      name: 'email',
                      hintText: 'Email',
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    AuthInputWidget(
                        name: 'password',
                        hintText: 'Password',
                        isPassword: true,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(6),
                        ])),
                    const SizedBox(height: 20),
                    RoundedButton(
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          print(_formKey.currentState!.value);
                        }
                      },
                      label: 'Login',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                          style: TextButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            context.go('/signup');
                          },
                          child: const Text(
                            'Signup',
                            style: TextStyle(color: Pallete.blueColor),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
