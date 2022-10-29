import 'package:auto_route/auto_route.dart';
import 'package:budgetplanner/presentation/routes/router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: () {
            AutoRouter.of(context).push(const AccountDetailsRoute());
          },
          child: const ListTile(
            title: Text(
              "Account",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            AutoRouter.of(context).push(const AgbRoute());
          },
          child: const ListTile(
            title: Text(
              "Datenschutz",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
