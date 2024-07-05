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
  List<UserCard?> userCards = [];
  List<User?> users = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF006494),
        elevation: .0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Lista de usuarios',
            style: TextStyle(color: Color(0xFFFFFFFF))),
        actions: <Widget>[],
      ),
      body: Container(
        color: Color(0xFFF6F6F6),
        child: users.length <= 0
            ? Padding(
                padding: EdgeInsets.all(32.0),
                child: Center(
                  child: EmptyState(
                    title: 'Ups',
                    message:
                        'No tienes ningún ususario registrado todavía, toca el botón para empezar',
                  ),
                ))
            : ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return UserCard(
                      user: users[index]!,
                      callback: (index) {
                        deleteUser(index);
                      },
                      addCallback: (user) {
                        checkAndAddUser(user);
                      },
                      itemIndex: index);
                },
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

  void deleteUser(int index) {
    User? userToRemove = users[index];
    users.removeWhere((user) => user!.id == userToRemove!.id);
    setState(() {});
  }

  ///on add form
  void onAddForm() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormScreen(callback: checkAndAddUser)),
    ).then((result) => setState(() {
          User? user = result as User?;
          checkAndAddUser(user);
        }));
  }

  void checkAndAddUser(User? user) {
    if (user != null) {
      var (userExists, index) = checkUserExists(user);
      if (userExists) {
        setState(() {
          users[index] = user;
        });
      } else {
        setState(() {
          users.add(user);
        });
      }
    }
  }

  (bool, int) checkUserExists(User user) {
    bool userExists = false;
    int index = -1;
    for (var i = 0; i < users.length; i++) {
      if (user.id == users[i]!.id) {
        userExists = true;
        index = i;
      }
    }
    return (userExists, index);
  }
}
