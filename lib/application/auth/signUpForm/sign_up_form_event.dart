part of 'sign_up_form_bloc.dart';

@immutable
abstract class SignUpFormEvent {}

//Registrierungs-Event
class RegisterWithEmailAndPasswordPressed extends SignUpFormEvent {
  //Parameter
  final String? email;
  final String? password;
  //Required setzen, da beide Paramter für die Registrierung benötigt werden
  RegisterWithEmailAndPasswordPressed(
      {required this.email, required this.password});
}

//Login-Event
class LoginWithEmailAndPasswordPressed extends SignUpFormEvent {
  //Parameter
  final String? email;
  final String? password;
  //Required setzen
  LoginWithEmailAndPasswordPressed(
      {required this.email, required this.password});
}
