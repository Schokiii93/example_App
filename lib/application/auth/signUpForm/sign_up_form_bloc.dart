import 'package:bloc/bloc.dart';
import 'package:budgetplanner/core/failures/auth_failures.dart';
import 'package:budgetplanner/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  //Dependency zu Repository
  final AuthRepository authRepository;
  SignUpFormBloc({required this.authRepository})

      //Zu Beginn wird keine Validierung ausgeführt
      //Und nichts wird submitted
      : super(SignUpFormState(
            isSubmitting: false,
            showValidationMessages: false,
            authFailureOrSuccessOption: none())) {
    //Auf die beiden Events reagieren
    on<RegisterWithEmailAndPasswordPressed>((event, emit) async {
      if (event.email == null || event.password == null) {
        //Submitted wird nicht mehr, aber Fehler werden ausgegeben
        emit(state.copyWith(
          isSubmitting: false,
          showValidationMessages: true,
        ));
      } else {
        //Da Email und Paswort da sind, können wir submitten, Fehlermeldungen brauchen wir nicht mehr
        emit(state.copyWith(
          isSubmitting: true,
          showValidationMessages: false,
        ));
        //Authentication triggern
        final failureOrSuccess =
            await authRepository.registerWithEmailAndPassword(
                email: event.email!, password: event.password!);
        //optionOf kann ich mit option belegen (authFailureOrSuccessOption)
        emit(state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ));
      }
    });
    on<LoginWithEmailAndPasswordPressed>((event, emit) async {
      //If Abfrage, falls Email oder Passwort null ist
      if (event.email == null || event.password == null) {
        //mit emit fügen wir einen neuen state hinzu
        //Submitted wird nicht mehr, aber Fehler werden ausgegeben
        emit(
          state.copyWith(isSubmitting: false, showValidationMessages: true),
        );
      } else {
        emit(
          //Da Email und Paswort da sind, können wir submitten, Fehlermeldungen brauchen wir nicht mehr
          state.copyWith(isSubmitting: true, showValidationMessages: false),
        );
        //Die Authentication wird getriggert
        //Wir prüfen ja oben schon, ob der Wert null ist, daher "!" (sicher nicht null)
        final failureOrSuccess = await authRepository.loginWithEmailAndPassword(
            email: event.email!, password: event.password!);
        //optionOf können wir mit option belegen (authFailureOrSuccessOption)
        emit(state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ));
      }
    });
  }
}
