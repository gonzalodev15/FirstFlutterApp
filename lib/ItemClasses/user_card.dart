import 'package:first_flutter_app/ItemClasses/user.dart';
import 'package:first_flutter_app/routes/detail_screen.dart';
import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  final User user;
  final state = _UserCardState();

  UserCard({required this.user});
  @override
  _UserCardState createState() => state;
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => { goToDetail()},
      child: Padding(
      padding: EdgeInsets.only(right: 12.0, left: 12.0, top: 8.0, bottom: 4.0),
      child: Card(
      color: Color(0xFFd3d3d3),
      child: Column(children: [
        Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(children: [Text('Nombre: '), Text(widget.user.name)])),
        Padding(
        padding: EdgeInsets.only(right: 12.0, left: 12.0, bottom: 12.0),
        child: Row(children: [Text('Trabajo: '), Text(widget.user.job)]))
      ],),
      )));
  }

void goToDetail() {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DetailScreen(user: widget.user)),
  );
  }

}