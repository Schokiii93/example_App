// ignore_for_file: no_leading_underscores_for_local_identifiers, avoid_types_as_parameter_names, file_names

import 'package:auto_route/auto_route.dart';
import 'package:budgetplanner/application/auth/authBloc/auth_bloc.dart';
import 'package:budgetplanner/application/budgetEntries/observer/observer_bloc.dart';
import 'package:budgetplanner/injection.dart';
import 'package:budgetplanner/presentation/home/options/options.dart';
import 'package:budgetplanner/presentation/routes/router.gr.dart';
import 'package:budgetplanner/presentation/signup/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootWidget extends StatefulWidget {
  const RootWidget({Key? key}) : super(key: key);

//State für Navigation, ausgewähltes Item
  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  //Variablen für das Umschalten des Seiten
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    //get observer bloc
    final observerBloc = sl<ObserverBloc>()..add(ObserveAllEvent());
    return MultiBlocProvider(
      providers: [
        BlocProvider<ObserverBloc>(create: (context) => observerBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: (context, state) {
            //Falls ausgeloggt, dann SignIn Form anzeigen
            if (state is AuthStateUnauthenticated) {
              AutoRouter.of(context).push(const SignUpPageRoute());
            }
          })
        ],
        child: Scaffold(
          //Wert der jeweiligen Seite wird immer behalten
          body: IndexedStack(
            index: _currentIndex,
            children: const [
              OptionsPage(),
              SignUpPage(),
            ],
          ),

          //Navigationbar
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                //Aktuellen index dem State zuweisen
                _currentIndex = index;
              });
            },
            //Aktuelle App liegt nun in currentIndex
            currentIndex: _currentIndex,
            //Farbe ändern
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            //NavigationBar Items
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menü'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            ],
          ),
        ),
      ),
    );
  }
}
