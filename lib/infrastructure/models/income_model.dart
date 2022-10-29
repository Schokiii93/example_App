import 'package:budgetplanner/domain/entities/id.dart';
import 'package:budgetplanner/domain/entities/incomeEntry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IncomeModel {
  final String id;
  final String income;
  final String type;

  IncomeModel({
    required this.income,
    required this.id,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'income': income,
      'type': type,
    };
  }

  factory IncomeModel.fromMap(Map<String, dynamic> map) {
    return IncomeModel(
      id: "",
      income: map['income'] as String,
      type: map['type'] as String,
    );
  }

  IncomeModel copyWith({
    String? id,
    String? income,
    String? type,
  }) {
    return IncomeModel(
      id: id ?? this.id,
      income: income ?? this.income,
      type: type ?? this.type,
    );
  }

  factory IncomeModel.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return IncomeModel.fromMap(doc.data()).copyWith(id: doc.id);
  }

  IncomeEntry toDomain() {
    return IncomeEntry(
      id: UniqueID.fromUniqueString(id),
      income: income,
      type: type,
    );
  }

  factory IncomeModel.fromDomain(IncomeEntry incomeEntryItem) {
    return IncomeModel(
      id: incomeEntryItem.id.value,
      income: incomeEntryItem.income,
      type: incomeEntryItem.type,
    );
  }
}
