import 'package:flutter/material.dart';
import 'package:first_flutter_app/ItemClasses/user.dart';

typedef OnDelete();

class UserForm extends StatefulWidget {
  final User user;
  final state = _UserFormState();
  final OnDelete onDelete;

  UserForm({Key? key, required this.user, required this.onDelete}) : super(key: key);
  @override
  _UserFormState createState() => state;

  bool isValid() => state.validate();
}

class _UserFormState extends State<UserForm> {
  final form = GlobalKey<FormState>();
  late final TextEditingController nameController = TextEditingController();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController phoneController = TextEditingController();
  late final TextEditingController jobController = TextEditingController();
  late final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
             AppBar(
               leading: Icon(Icons.people),
               title: Text(
                'Ingresa los datos del usuario',
                style: TextStyle(color: Colors.white),
               ),
               backgroundColor: Color(0xFF006494),
               centerTitle: true,
             ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  controller: nameController,
                  onSaved: (val) => widget.user.name = val!,
                  validator: (val) =>
                      val!.length > 3 ? null : 'Full name is invalid',
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Enter your full name',
                    icon: Icon(Icons.person),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  controller: emailController,
                  onSaved: (val) => widget.user.email = val!,
                  validator: (val) =>
                      val!.length > 3 ? null : 'Email is invalid',
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    icon: Icon(Icons.email),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  controller: phoneController,
                  onSaved: (val) => widget.user.phone = val!,
                  validator: (val) =>
                      val!.length > 3 ? null : 'Phone is invalid',
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    hintText: 'Enter your phone',
                    icon: Icon(Icons.phone),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  controller: jobController,
                  onSaved: (val) => widget.user.job = val!,
                  validator: (val) =>
                      val!.length > 3 ? null : 'Job is invalid',
                  decoration: InputDecoration(
                    labelText: 'Job',
                    hintText: 'Enter your Job',
                    icon: Icon(Icons.work),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextFormField(
                  controller: descriptionController,
                  onSaved: (val) => widget.user.description = val!,
                  validator: (val) =>
                      val!.length > 3 ? null : 'Description is invalid',
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Enter your Description',
                    icon: Icon(Icons.description),
                    isDense: true,
                  ),
                  maxLines: 6,
                ),
              ),
              FilledButton(
                onPressed: () {
                  User user = User(name: nameController.text, email: emailController.text, phone: phoneController.text, job: jobController.text, description: descriptionController.text);
                  Navigator.pop(context, user);
                }, 
                child: Text('Agregar'),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xFF006494)),
                  ),
                )
           ]),
        )
    );
  }

  bool validate() {
    var valid = form.currentState!.validate();
    if (valid) form.currentState!.save();
    return valid;
  }
}

