import 'package:budgetplanner/application/auth/authBloc/auth_bloc.dart';
import 'package:budgetplanner/injection.dart';
import 'package:budgetplanner/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:budgetplanner/injection.dart' as di;
import 'package:budgetplanner/presentation/routes/router.gr.dart' as r;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  //Sicherstellen, dass alles initialisert wurde, bevor Widgets gebaut werden
  WidgetsFlutterBinding.ensureInitialized();
  //Firebase aktivieren
  await Firebase.initializeApp();
  //injection container initialisieren vor Start der App
  //also zuerst dependency injection, danach startet die App erst
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //AppRouter Variable, gibt Instanz des AppRouters aus
  final _appRouter = r.AppRouter();
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>()..add(AuthCheckRequested()),
        ),
      ],
      child: MaterialApp.router(
        //Router Infos liefern
        routeInformationParser: _appRouter.defaultRouteParser(),
        //Der Router wird der App sagen, welche Page als erstes angezeigt werden soll
        routerDelegate: _appRouter.delegate(),
        //Debug Banner ausblenden
        debugShowCheckedModeBanner: false,
        title: 'Todo Liste',
        //Theme einstellen
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
