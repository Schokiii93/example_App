import 'package:auto_route/auto_route.dart';
import 'package:budgetplanner/application/auth/authBloc/auth_bloc.dart';
import 'package:budgetplanner/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Listener vom Typ "AuthBloc"
    //Hört auf den "BlocState"
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateAuthenticated) {
          //Navigation zur Homepage
          //Alternative Schreibweise für den Autorouter()
          context.router.replace(const HomePageLoggedInRoute());
        } else if (state is AuthStateUnauthenticated) {
          //Navigation zum Login
          context.router.replace(const SignUpPageRoute());
        }
      },
      child: Scaffold(
        body: Center(
          //Hier wird zentral ein loading-indicator angezeigt
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
