part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

//Initialer State zu Beginn
class AuthInitial extends AuthState {}

//State für eingeloggten zustand
class AuthStateAuthenticated extends AuthState {}

//State für nicht eingeloggten Zustand
class AuthStateUnauthenticated extends AuthState {}
