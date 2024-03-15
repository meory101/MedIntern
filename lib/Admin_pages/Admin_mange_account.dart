import 'package:flutter/material.dart';

class AdminmangeAccounts extends StatefulWidget {
  const AdminmangeAccounts({super.key});

  @override
  State<AdminmangeAccounts> createState() => _AdminmangeAccountsState();
}

class _AdminmangeAccountsState extends State<AdminmangeAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          alignment: Alignment.topLeft,
          width: 20,
          child: Image(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/appbar.png'),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            child: Text("Mange Account",),
          )
        ],
      ),
    );
  }
}
