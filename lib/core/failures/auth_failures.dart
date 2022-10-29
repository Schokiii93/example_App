abstract class AuthFailure {}

class serverFailure extends AuthFailure {}

class emailAlreadyInUseFailure extends AuthFailure {}

class invalidEmailAndPasswordFailure extends AuthFailure {}
