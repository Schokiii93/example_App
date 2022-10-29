import 'package:flutter/material.dart';

import 'package:budgetplanner/domain/entities/incomeEntry.dart';

class IncomeWidget extends StatelessWidget {
  final IncomeEntry incomeEntry;
  const IncomeWidget({super.key, required this.incomeEntry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        title: Text(incomeEntry.type),
        subtitle: Text(incomeEntry.income),
      ),
    );
  }
}
