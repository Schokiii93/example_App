// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../account_page/account_details.dart' as _i9;
import '../account_page/agb.dart' as _i10;
import '../bottomNavPages/account.dart' as _i8;
import '../bottomNavPages/budget.page.dart' as _i6;
import '../bottomNavPages/income.dart' as _i5;
import '../bottomNavPages/transactions.dart' as _i7;
import '../home/homepage_loggedOut.dart' as _i2;
import '../home/homepage_LoggedIn.dart' as _i1;
import '../signup/signup_page.dart' as _i4;
import '../splash/splash_page.dart' as _i3;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    HomePageLoggedInRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePageLoggedIn(),
      );
    },
    RootWidgetRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RootWidget(),
      );
    },
    SplashPageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SplashPage(),
      );
    },
    SignUpPageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpPage(),
      );
    },
    IncomePageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.IncomePage(),
      );
    },
    BudgetPageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.BudgetPage(),
      );
    },
    TransactionPageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.TransactionPage(),
      );
    },
    AccountPageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.AccountPage(),
      );
    },
    AccountDetailsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AccountDetails(),
      );
    },
    AgbRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.Agb(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          HomePageLoggedInRoute.name,
          path: '/home-page-logged-in',
        ),
        _i11.RouteConfig(
          RootWidgetRoute.name,
          path: '/root-widget',
        ),
        _i11.RouteConfig(
          SplashPageRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          SignUpPageRoute.name,
          path: '/sign-up-page',
        ),
        _i11.RouteConfig(
          IncomePageRoute.name,
          path: '/income-page',
        ),
        _i11.RouteConfig(
          BudgetPageRoute.name,
          path: '/budget-page',
        ),
        _i11.RouteConfig(
          TransactionPageRoute.name,
          path: '/transaction-page',
        ),
        _i11.RouteConfig(
          AccountPageRoute.name,
          path: '/account-page',
        ),
        _i11.RouteConfig(
          AccountDetailsRoute.name,
          path: '/account-details',
        ),
        _i11.RouteConfig(
          AgbRoute.name,
          path: '/Agb',
        ),
      ];
}

/// generated route for
/// [_i1.HomePageLoggedIn]
class HomePageLoggedInRoute extends _i11.PageRouteInfo<void> {
  const HomePageLoggedInRoute()
      : super(
          HomePageLoggedInRoute.name,
          path: '/home-page-logged-in',
        );

  static const String name = 'HomePageLoggedInRoute';
}

/// generated route for
/// [_i2.RootWidget]
class RootWidgetRoute extends _i11.PageRouteInfo<void> {
  const RootWidgetRoute()
      : super(
          RootWidgetRoute.name,
          path: '/root-widget',
        );

  static const String name = 'RootWidgetRoute';
}

/// generated route for
/// [_i3.SplashPage]
class SplashPageRoute extends _i11.PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: '/',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i4.SignUpPage]
class SignUpPageRoute extends _i11.PageRouteInfo<void> {
  const SignUpPageRoute()
      : super(
          SignUpPageRoute.name,
          path: '/sign-up-page',
        );

  static const String name = 'SignUpPageRoute';
}

/// generated route for
/// [_i5.IncomePage]
class IncomePageRoute extends _i11.PageRouteInfo<void> {
  const IncomePageRoute()
      : super(
          IncomePageRoute.name,
          path: '/income-page',
        );

  static const String name = 'IncomePageRoute';
}

/// generated route for
/// [_i6.BudgetPage]
class BudgetPageRoute extends _i11.PageRouteInfo<void> {
  const BudgetPageRoute()
      : super(
          BudgetPageRoute.name,
          path: '/budget-page',
        );

  static const String name = 'BudgetPageRoute';
}

/// generated route for
/// [_i7.TransactionPage]
class TransactionPageRoute extends _i11.PageRouteInfo<void> {
  const TransactionPageRoute()
      : super(
          TransactionPageRoute.name,
          path: '/transaction-page',
        );

  static const String name = 'TransactionPageRoute';
}

/// generated route for
/// [_i8.AccountPage]
class AccountPageRoute extends _i11.PageRouteInfo<void> {
  const AccountPageRoute()
      : super(
          AccountPageRoute.name,
          path: '/account-page',
        );

  static const String name = 'AccountPageRoute';
}

/// generated route for
/// [_i9.AccountDetails]
class AccountDetailsRoute extends _i11.PageRouteInfo<void> {
  const AccountDetailsRoute()
      : super(
          AccountDetailsRoute.name,
          path: '/account-details',
        );

  static const String name = 'AccountDetailsRoute';
}

/// generated route for
/// [_i10.Agb]
class AgbRoute extends _i11.PageRouteInfo<void> {
  const AgbRoute()
      : super(
          AgbRoute.name,
          path: '/Agb',
        );

  static const String name = 'AgbRoute';
}
