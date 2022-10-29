import 'package:budgetplanner/application/budgetEntries/observer/observer_bloc.dart';
import 'package:budgetplanner/presentation/home/widgets/budgetItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ObserverBloc, ObserverState>(builder: (context, state) {
      //initial state
      if (state is ObserverInitial) {
        return Container();
        //loading indicator while page is loading
      } else if (state is ObserverLoading) {
        return const Center(
          child: CircularProgressIndicator(color: Colors.white),
        );
        //Failure
      } else if (state is ObserverFailure) {
        return const Center(child: Text("Failure"));
      }
      //Success
      else if (state is ObserverSucccess) {
        return Center(
          //child: Container(child: Text(user.email!)),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.budgetEntry.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 6 / 2,
                    mainAxisSpacing: 20),
                itemBuilder: (BuildContext context, int index) {
                  final budgetEntry = state.budgetEntry[index];
                  return BudgetItem(budgetEntry: budgetEntry);
                }),
          ),
        );
      }
      return Container();
    });
  }
}
