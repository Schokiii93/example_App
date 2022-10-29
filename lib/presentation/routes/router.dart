import 'package:auto_route/annotations.dart';
import 'package:budgetplanner/presentation/account_page/account_details.dart';
import 'package:budgetplanner/presentation/account_page/agb.dart';
import 'package:budgetplanner/presentation/bottomNavPages/account.dart';
import 'package:budgetplanner/presentation/bottomNavPages/budget.page.dart';
import 'package:budgetplanner/presentation/bottomNavPages/income.dart';
import 'package:budgetplanner/presentation/bottomNavPages/transactions.dart';
import 'package:budgetplanner/presentation/home/homepage_loggedOut.dart';
import 'package:budgetplanner/presentation/home/homepage_LoggedIn.dart';
import 'package:budgetplanner/presentation/signup/signup_page.dart';
import 'package:budgetplanner/presentation/splash/splash_page.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  //Pages, auf die Navigiert werden kann
  AutoRoute(page: HomePageLoggedIn, initial: false),
  AutoRoute(page: RootWidget, initial: false),
  AutoRoute(page: SplashPage, initial: true),
  AutoRoute(page: SignUpPage, initial: false),
  AutoRoute(page: IncomePage, initial: false),
  AutoRoute(page: BudgetPage, initial: false),
  AutoRoute(page: TransactionPage, initial: false),
  AutoRoute(page: AccountPage, initial: false),
  AutoRoute(page: AccountDetails, initial: false),
  AutoRoute(page: Agb, initial: false),
])

//$: hier soll etwas generiert werden
class $AppRouter {}
