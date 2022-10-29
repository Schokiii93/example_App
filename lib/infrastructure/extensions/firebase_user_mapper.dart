//hier legen wir eine extention an für user, um die Funktionalitäten zu erweitern
import 'package:firebase_auth/firebase_auth.dart';
import 'package:budgetplanner/domain/entities/id.dart';

import '../../domain/entities/user.dart';

extension FirebaseUserMapper on User {
  //User Klasse wird um Funktion "toDomain" erweitert
  //Ins domain layer kommen nur entities rein
  CustomUser toDomain() {
    //uid kommt von Firebase
    return CustomUser(id: UniqueID.fromUniqueString(uid));
  }
}
