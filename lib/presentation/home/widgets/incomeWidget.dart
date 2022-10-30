// ignore_for_file: file_names

import 'package:budgetplanner/domain/entities/incomeEntry.dart';
import 'package:flutter/material.dart';

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
