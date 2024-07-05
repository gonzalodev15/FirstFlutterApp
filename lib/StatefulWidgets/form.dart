import 'package:first_flutter_app/StatefulWidgets/detail.dart';
import 'package:first_flutter_app/StatefulWidgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/ItemClasses/user.dart';
import 'package:uuid/uuid.dart';


class UserForm extends StatefulWidget {
  User user;
  final state = _UserFormState();
  bool isEditing;
  bool comesFromDetail;
  final AddCallback? callback;

  UserForm({Key? key, required this.isEditing, required this.comesFromDetail, this.callback, required this.user}) : super(key: key);
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

  void initializeControllers() {
    nameController.text = widget.user.name;
    emailController.text = widget.user.email;
    phoneController.text = widget.user.phone;
    jobController.text = widget.user.job;
    descriptionController.text = widget.user.description;
  }

  @override
  Widget build(BuildContext context) {
    initializeControllers();
    return Padding(
      padding: EdgeInsets.all(8),
      child: (widget.comesFromDetail == true && widget.isEditing == false) ? 
      Detail(user: widget.user, callback: widget.callback):
      Form(
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
                  User newUser;
                  if (widget.isEditing == false) {
                    newUser = User(id: Uuid().v8(),name: nameController.text, email: emailController.text, phone: phoneController.text, job: jobController.text, description: descriptionController.text);
                  } else {
                    newUser = User(id: widget.user.id,name: nameController.text, email: emailController.text, phone: phoneController.text, job: jobController.text, description: descriptionController.text);;
                  }
                  widget.user = newUser;
                  widget.isEditing = false;
                  widget.comesFromDetail = true;
                  setState(() {
                    
                  });
                }, 
                child: widget.isEditing == false ? Text('Agregar'): Text('Finalizar edición'),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xFF006494)),
                  ),
                ),
                widget.isEditing == true ? 
                 FilledButton(
                onPressed: () {
                  widget.isEditing = false;
                  setState(() {});
                }, 
                child: Text('Cancelar'),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Color(0xFF006494)),
                  ),
                ): Container()
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

