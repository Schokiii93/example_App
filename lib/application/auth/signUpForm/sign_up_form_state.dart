// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_form_bloc.dart';

class SignUpFormState {
  //Paremter?
  final bool isSubmitting; //Zeigt Loading indicator auf Page an
  final bool showValidationMessages; //Field validation
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;

  //Konstruktor
  SignUpFormState(
      {required this.isSubmitting,
      required this.showValidationMessages,
      required this.authFailureOrSuccessOption});

  SignUpFormState copyWith({
    bool? isSubmitting,
    bool? showValidationMessages,
    Option<Either<AuthFailure, Unit>>? authFailureOrSuccessOption,
  }) {
    return SignUpFormState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      showValidationMessages:
          showValidationMessages ?? this.showValidationMessages,
      authFailureOrSuccessOption:
          authFailureOrSuccessOption ?? this.authFailureOrSuccessOption,
    );
  }
}
