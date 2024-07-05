import 'package:first_flutter_app/ItemClasses/form.dart';
import 'package:first_flutter_app/ItemClasses/user.dart';
import 'package:first_flutter_app/ItemClasses/user_card.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final User user;
  final AddCallback? callback;

  Detail({required this.user, required this.callback});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isEditing = false;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        User? userToReturn = User(id: widget.user.id, name: widget.user.name, email: widget.user.email, job: widget.user.job, description: widget.user.description, phone: widget.user.phone);
        widget.callback!.call(userToReturn);
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        body: isEditing == false
            ? Column(children: [
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                        children: [Text('Nombre: '), Text(widget.user.name)])),
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                        children: [Text('Trabajo: '), Text(widget.user.job)])),
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                        children: [Text('Email: '), Text(widget.user.email)])),
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(children: [
                      Text('Teléfono: '),
                      Text(widget.user.phone)
                    ])),
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(children: [
                      Text('Descripción: '),
                      Text(widget.user.description)
                    ])),
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: FilledButton(
                      onPressed: () {
                        isEditing = true;
                        setState(() {});
                      },
                      child: Text('Editar'),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xFF006494)),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.all(12.0),
                    child: FilledButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) =>  AlertDialog(
                              title: new Text('Are you sure?'),
                              content: new Text('Unsaved data will be lost.'),
                              actions: <Widget>[
                                FilledButton(
                                  onPressed: () => Navigator.pop(
                                      context), // Closes the dialog
                                  child: new Text('No'),
                                ),
                                FilledButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Closes the dialog
                                    Navigator.pop(context, widget.user);
                                  },
                                  child: new Text('Yes'),
                                ),
                              ],
                            ));
                      },
                      child: Text('Eliminar'),
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xFF006494)),
                      ),
                    ))
              ])
            : UserForm(user: widget.user, isEditing: true, callback: widget.callback, comesFromDetail: true)));
  }
}
