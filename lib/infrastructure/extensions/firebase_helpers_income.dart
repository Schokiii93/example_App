import 'package:budgetplanner/core/errors/errors.dart';
import 'package:budgetplanner/domain/repositories/auth_repository.dart';
import 'package:budgetplanner/injection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

extension FireStoreExt2 on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = sl<AuthRepository>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return FirebaseFirestore.instance.collection('Users').doc(user.id.value);
  }
}

//Navigation in Ordner in firestore, in dem dann die entries liegen
extension DocumentReferenceExt on DocumentReference {
  CollectionReference<Map<String, dynamic>> get incomeCollection =>
      //beim Verweis auf den Pfad auf die korrekte Schreibwese aus Firebase achten
      collection("IncomeFirebase");
}
