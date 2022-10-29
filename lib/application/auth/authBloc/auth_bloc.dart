import 'package:bloc/bloc.dart';
import 'package:budgetplanner/domain/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<SignOutPressedEvent>((event, emit) async {
      //Zuerst wartet die Funktion auf den Logout
      await authRepository.signOut();
      //Danach ändert sich der state
      emit(AuthStateUnauthenticated());
    });

    on<AuthCheckRequested>((event, emit) async {
      final userOption = authRepository.getSignedInUser();
      //bei einem Option kann ich immer fold machen, um auf none und some zu reagieren
      userOption.fold(() => emit(AuthStateUnauthenticated()),
          (a) => emit(AuthStateAuthenticated()));
    });
  }
}
