// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:budgetplanner/domain/entities/id.dart';

class BudgetEntry {
  final UniqueID id;
  final String category;
  final String budget;
  final String expense;

  BudgetEntry({
    required this.id,
    required this.category,
    required this.budget,
    required this.expense,
  });

  //Factory Konstruktor to get empty entry
  factory BudgetEntry.empty() {
    return BudgetEntry(
      id: UniqueID(),
      category: "",
      budget: "",
      expense: "",
    );
  }

  BudgetEntry copyWith({
    UniqueID? id,
    String? category,
    String? budget,
    String? expense,
  }) {
    return BudgetEntry(
      id: id ?? this.id,
      category: category ?? this.category,
      budget: budget ?? this.budget,
      expense: expense ?? this.expense,
    );
  }
}
