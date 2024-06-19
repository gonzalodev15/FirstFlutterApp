import 'package:first_flutter_app/ItemClasses/user.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final User user;
  DetailScreen({required this.user});

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
        backgroundColor:Color(0xFFF6F6F6),
        body: Column(children: [
        Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(children: [Text('Nombre: '), Text(user.name)])),
        Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(children: [Text('Trabajo: '), Text(user.job)])),
        Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(children: [Text('Email: '), Text(user.email)])),
        Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(children: [Text('Teléfono: '), Text(user.phone)])),
        Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(children: [Text('Descripción: '), Text(user.description)])),]
        ));
  }
}
