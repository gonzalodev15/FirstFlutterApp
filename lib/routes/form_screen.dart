import 'package:first_flutter_app/ItemClasses/form.dart';
import 'package:first_flutter_app/ItemClasses/user.dart';
import 'package:first_flutter_app/ItemClasses/user_card.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  final AddCallback? callback;
  const FormScreen({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    var _user = User();
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: const Text(
            'Agregar usuario',
            style: TextStyle(color: Colors.white),
            ),
          backgroundColor: Color(0xFF006494),
        ),
        backgroundColor:Color(0xFFF6F6F6),
        body: UserForm(
          user: _user,
          isEditing: false,
          comesFromDetail: false,
          callback: callback,
        ));
  }
}
