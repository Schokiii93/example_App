// ignore_for_file: file_names, sort_child_properties_last, prefer_interpolation_to_compose_strings, duplicate_ignore

import 'package:budgetplanner/domain/entities/budgetEntry.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BudgetItem extends StatelessWidget {
  final BudgetEntry budgetEntry;
  const BudgetItem({super.key, required this.budgetEntry});

  @override
  Widget build(BuildContext context) {
    //Variables
    double budget = double.parse(budgetEntry.budget);
    double expense = double.parse(budgetEntry.expense);
    double rest = budget - expense;
    var percent = expense * 100 / budget / 100;
    var percent2 = expense * 100 / budget;
    //Card Element
    return Card(
      elevation: 20,
      color: Colors.blueAccent,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              width: 0.5,
              color: Colors.white,
            ))),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    budgetEntry.category,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Spacer(),
                  Text(
                    // ignore: prefer_interpolation_to_compose_strings
                    percent2.toStringAsFixed(0) + " %",
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            height: 30,
          ),
          Expanded(
              child: Row(children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Budget",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    budget.toStringAsFixed(2) + "€",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        textAlign: TextAlign.right,
                        "Ausgaben:",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: 80,
                        child: Text(
                          expense.toStringAsFixed(2) + "€",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        textAlign: TextAlign.right,
                        "Rest:",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Container(
                        width: 80,
                        alignment: Alignment.centerRight,
                        child: Text(
                          rest.toStringAsFixed(2) + "€",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ])),
          SizedBox(
            height: 10,
            child: LinearPercentIndicator(
              padding: EdgeInsets.zero,
              animation: true,
              progressColor: Colors.lightBlueAccent,
              percent: percent,
              backgroundColor: Colors.white,
              lineHeight: double.infinity,
              barRadius: const Radius.circular(3),
            ),
          ),
        ],
      ),
    );
  }
}
