import 'package:budgetplanner/application/incomeEntries/observer/income_observer_bloc.dart';
import 'package:budgetplanner/domain/entities/incomeEntry.dart';
import 'package:budgetplanner/presentation/home/widgets/incomeWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IncomeObserverBloc, IncomeObserverState>(
        builder: (context, state) {
      if (state is IncomeObserverInitial) {
        return Container();
      }
      //Solange die Seite lädt, soll ein loading indicator angezeigt werden
      else if (state is IncomeObserverLoading) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      }
      //Failure
      else if (state is IncomeObserverFailure) {
        return const Center(child: Text("Failure"));
      }

      //Success
      else if (state is IncomeObserverSuccess) {
        return ListView.builder(
          itemCount: state.incomeEntry.length,
          itemBuilder: (BuildContext context, int index) {
            final incomeEntry = state.incomeEntry[index];
            return IncomeWidget(incomeEntry: incomeEntry);
          },
        );
      }
      return Container();
    });
  }
}
