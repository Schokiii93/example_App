// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:budgetplanner/domain/entities/budgetEntry.dart';
import 'package:budgetplanner/domain/entities/id.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Take objects from firebase and change to entity
class BudgetModel {
  final String id;
  final String category;
  final String budget;
  final String expense;

  BudgetModel({
    required this.category,
    required this.budget,
    required this.id,
    required this.expense,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'budget': budget,
      'expense': expense,
    };
  }

  factory BudgetModel.fromMap(Map<String, dynamic> map) {
    return BudgetModel(
      id: "",
      category: map['category'] as String,
      budget: map['budget'] as String,
      expense: map['expense'] as String,
    );
  }

  BudgetModel copyWith({
    String? id,
    String? category,
    String? budget,
    String? expense,
  }) {
    return BudgetModel(
      id: id ?? this.id,
      category: category ?? this.category,
      budget: budget ?? this.budget,
      expense: expense ?? this.expense,
    );
  }

  factory BudgetModel.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return BudgetModel.fromMap(doc.data()).copyWith(id: doc.id);
  }

  BudgetEntry toDomain() {
    return BudgetEntry(
      id: UniqueID.fromUniqueString(id),
      budget: budget,
      expense: expense,
      category: category,
    );
  }

  factory BudgetModel.fromDomain(BudgetEntry budgetEntryItem) {
    return BudgetModel(
      category: budgetEntryItem.category,
      budget: budgetEntryItem.budget,
      expense: budgetEntryItem.expense,
      id: budgetEntryItem.id.value,
    );
  }
}
