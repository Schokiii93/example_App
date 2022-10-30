// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:budgetplanner/domain/entities/id.dart';

class IncomeEntry {
  final UniqueID id;
  final String income;
  final String type;

  IncomeEntry({
    required this.id,
    required this.income,
    required this.type,
  });

  //Factory Konstruktor to get empty entry
  factory IncomeEntry.empty() {
    return IncomeEntry(
      id: UniqueID(),
      income: "",
      type: "",
    );
  }

  IncomeEntry copyWith({
    UniqueID? id,
    String? income,
    String? type,
  }) {
    return IncomeEntry(
      id: id ?? this.id,
      income: income ?? this.income,
      type: type ?? this.type,
    );
  }
}
