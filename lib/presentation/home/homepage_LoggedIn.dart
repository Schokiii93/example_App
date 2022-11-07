// ignore_for_file: file_names, prefer_const_constructors, duplicate_ignore

import 'package:auto_route/auto_route.dart';
import 'package:budgetplanner/application/budgetEntries/observer/observer_bloc.dart';
import 'package:budgetplanner/application/incomeEntries/observer/income_observer_bloc.dart';
import 'package:budgetplanner/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:budgetplanner/application/auth/authBloc/auth_bloc.dart';
import 'package:budgetplanner/presentation/bottomNavPages/account.dart';
import 'package:budgetplanner/presentation/bottomNavPages/budget.page.dart';
import 'package:budgetplanner/presentation/bottomNavPages/income.dart';
import 'package:budgetplanner/presentation/bottomNavPages/transactions.dart';
import 'package:budgetplanner/presentation/routes/router.gr.dart';

class HomePageLoggedIn extends StatefulWidget {
  const HomePageLoggedIn({Key? key}) : super(key: key);

  @override
  State<HomePageLoggedIn> createState() => _HomePageLoggedInState();
}

class _HomePageLoggedInState extends State<HomePageLoggedIn> {
  int currentIndex = 3;

  var tabLabels = ['Account', 'Beträge', 'Transaktionen', 'Budget'];

  @override
  Widget build(BuildContext context) {
    //get observer
    final incomeObserverBloc = sl<IncomeObserverBloc>()
      ..add(IncomeObserveAllEvent());
    final observerBloc = sl<ObserverBloc>()..add(ObserveAllEvent());
    return MultiBlocProvider(
      providers: [
        BlocProvider<ObserverBloc>(create: (context) => observerBloc),
        BlocProvider<IncomeObserverBloc>(
            create: (context) => incomeObserverBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: (context, state) {
            //Wenn ich unauthenticated bin, dann sehe ich die SignUpPage, also das Login Form
            if (state is AuthStateUnauthenticated) {
              AutoRouter.of(context).push(const SignUpPageRoute());
            }
          }),
        ],
        child: Scaffold(
          appBar: AppBar(
              title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(tabLabels[currentIndex]),
          )),
          body: IndexedStack(
            index: currentIndex,
            children: const [
              AccountPage(),
              IncomePage(),
              TransactionPage(),
              BudgetPage()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            currentIndex: currentIndex,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: tabLabels[0]),
              BottomNavigationBarItem(
                  icon: Icon(Icons.euro), label: tabLabels[1]),
              BottomNavigationBarItem(
                  icon: Icon(Icons.compare_arrows), label: tabLabels[2]),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance), label: tabLabels[3]),
            ],
          ),
        ),
      ),
    );
  }
}
