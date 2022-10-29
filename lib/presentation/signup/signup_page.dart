import 'package:budgetplanner/application/auth/signUpForm/sign_up_form_bloc.dart';
import 'package:budgetplanner/injection.dart';
import 'package:budgetplanner/presentation/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => sl<SignUpFormBloc>(), child: const SignUpForm()),
    );
  }
}
