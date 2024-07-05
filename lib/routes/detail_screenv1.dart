import 'package:first_flutter_app/StatefulWidgets/detail.dart';
import 'package:first_flutter_app/ItemClasses/user.dart';
import 'package:first_flutter_app/StatefulWidgets/user_card.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  User user;
  final AddCallback addCallback;
  DetailScreen({super.key, required this.user, required this.addCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: const Text(
            'Detalle del usuario',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xFF006494),
        ),
        backgroundColor: Color(0xFFF6F6F6),
        body: Detail(
          user: user,
          callback: addCallback
        ));
  }
}
