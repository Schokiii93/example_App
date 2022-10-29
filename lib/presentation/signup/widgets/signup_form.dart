import 'package:auto_route/auto_route.dart';
import 'package:budgetplanner/application/auth/signUpForm/sign_up_form_bloc.dart';
import 'package:budgetplanner/core/failures/auth_failures.dart';
import 'package:budgetplanner/core/validation/validators.dart';
import 'package:budgetplanner/presentation/global_widgets/button.dart';
import 'package:budgetplanner/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    //Fehlermeldungen bei Login/Reg
    String mapFailureMessage(AuthFailure failure) {
      switch (failure.runtimeType) {
        case serverFailure:
          return "Da ist etwas schief gelaufen!";
        case emailAlreadyInUseFailure:
          return "Diese Email wird bereits verwendet.";
        case invalidEmailAndPasswordFailure:
          return "Email und Passwort Kombination falsch.";
        default:
          return "Da ist etwas schief gelaufen!";
      }
    }

    //Media Query für Größe des Bildes
    final size = MediaQuery.of(context).size;
    //Theme Data holen
    final themeData = Theme.of(context);
    //Global key für die Steuerung des Forms, damit Felder nicht sofort beim Aufruf validiert werden
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Column(
      children: <Widget>[
        const SizedBox(
          height: 50,
        ),
        Expanded(
          flex: 1,
          child: Image(
            width: size.width * 0.4,
            image: const AssetImage('assets/images/money.png'),
          ),
        ),
        Expanded(
          flex: 3,
          //SignUpFormBloc für Form verwenden
          child: BlocConsumer<SignUpFormBloc, SignUpFormState>(
            listenWhen: (p, c) =>
                p.authFailureOrSuccessOption != c.authFailureOrSuccessOption,
            listener: (context, state) {
              //wir greifen auf den state "authFailureOrSuccessOption" zu
              //entweder none {} (nichts) oder some (also etwas) steht drin
              state.authFailureOrSuccessOption.fold(
                  //wenn nicht erfolgreich, dann none
                  () => {},
                  //wenn erfolgreich, dann some
                  //hier kann aber auch wieder ein Fehler auftauchen
                  (eitherFailureOrSuccess) => eitherFailureOrSuccess.fold(
                          //Fehlermeldung
                          (failure) => {
                                //Ausgabe einer Snackbar, die auf die Variable von oben (Schritt vorher) zugreift
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      duration: const Duration(seconds: 5),
                                      backgroundColor: Colors.redAccent,
                                      content: Text(
                                        //mapFailureMessage in Funktion, da wir mehrere Fehler ausgeben werden
                                        mapFailureMessage(failure),
                                        style: themeData.textTheme.bodyText1,
                                      )),
                                )
                              }, (_) {
                        //HomePageRoute wurde automatisch von routes in der router.gr.dart angelegt
                        AutoRouter.of(context)
                            .replace(const HomePageLoggedInRoute());
                      }));
            },
            builder: (context, state) {
              return Form(
                autovalidateMode: state.showValidationMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    //Textfeld Willkommen
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'Willkommen',
                        style: themeData.textTheme.headline1!.copyWith(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'bei Monthly Budget',
                        style: themeData.textTheme.headline2!
                            .copyWith(fontSize: 30),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    //Email Eingabefeld
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        validator: validateEmail,
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(labelText: "E-Mail"),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //Passwort Eingabefeld
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        //Eingaben verbergen
                        obscureText: true,
                        validator: validatePassword,
                        cursorColor: Colors.white,
                        decoration:
                            const InputDecoration(labelText: "Passwort"),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    //Buttons nebeneinander in einer Row darstellen
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: GlobalButton(
                            buttonText: "Registrieren",
                            callback: () {
                              if (formKey.currentState!.validate()) {
                                //Wenn ok, dann Weiterleitung an BlocProvider
                                BlocProvider.of<SignUpFormBloc>(context).add(
                                    RegisterWithEmailAndPasswordPressed(
                                        email: email, password: password));
                              } else {
                                //Leere BlocProvider
                                BlocProvider.of<SignUpFormBloc>(context).add(
                                    RegisterWithEmailAndPasswordPressed(
                                        email: null, password: null));
                                //Bei Fehler eine Snackbar anzeigen
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  duration: const Duration(seconds: 5),
                                  backgroundColor: Colors.blueAccent,
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.contact_support),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Ungültige Eingaben",
                                        style: themeData.textTheme.bodyText1,
                                      )
                                    ],
                                  ),
                                ));
                              }
                            },
                          )),
                          const SizedBox(width: 20),
                          Expanded(
                              child: GlobalButton(
                            buttonText: "Login",
                            callback: () {
                              if (formKey.currentState!.validate()) {
                                //Wenn ok, dann Weiterleitung an BlocProvider
                                BlocProvider.of<SignUpFormBloc>(context).add(
                                    LoginWithEmailAndPasswordPressed(
                                        email: email, password: password));
                              } else {
                                //Leere BlocProvider
                                BlocProvider.of<SignUpFormBloc>(context).add(
                                    LoginWithEmailAndPasswordPressed(
                                        email: null, password: null));
                                //Bei Fehler eine Snackbar anzeigen
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  duration: const Duration(seconds: 5),
                                  backgroundColor: Colors.blueAccent,
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.contact_support),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Ungültige Eingaben",
                                        style: themeData.textTheme.bodyText1,
                                      )
                                    ],
                                  ),
                                ));
                              }
                            },
                          )),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
