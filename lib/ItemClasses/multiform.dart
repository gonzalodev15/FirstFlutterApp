import 'package:first_flutter_app/ItemClasses/empty_state.dart';
import 'package:first_flutter_app/ItemClasses/user.dart';
import 'package:first_flutter_app/ItemClasses/user_card.dart';
import 'package:first_flutter_app/routes/form_screen.dart';
import 'package:flutter/material.dart';


class MultiForm extends StatefulWidget {
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<UserCard?> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF006494),
        elevation: .0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Lista de usuarios',
          style: TextStyle(color: Color(0xFFFFFFFF))),
        actions: <Widget>[
        ],
      ),
      body: Container(
        color: Color(0xFFF6F6F6),
        child: users.length <= 0
            ? Padding(
              padding: EdgeInsets.all(32.0),
              child: Center(
                child: EmptyState(
                  title: 'Ups',
                  message: 'No tienes ningún ususario registrado todavía, toca el botón para empezar',
                ),
              ))
            : ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: users.length,
                itemBuilder: (_, i) => users[i],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF006494),
        onPressed: onAddForm,
        foregroundColor: Colors.white,
      ),
    );
  }

  ///on add form
  void onAddForm() {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const FormScreen()),
  ).then((result) => setState(() {
    User? user = result as User?;
    if (user != null) {
    users.add(UserCard(user: User(name: user.name, phone: user.phone, email: user.email, job: user.job, description: user.description)));
  }
  }) );
  }
}