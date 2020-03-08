import 'package:flutter/material.dart';

class TestingVal extends StatefulWidget {
  @override
  _TestingValState createState() => _TestingValState();
}

class _TestingValState extends State<TestingVal> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  void _submit(){
    final form = formKey.currentState;

    if(form.validate() == true){
      form.save();
      performLogin();
    }
  }
  void performLogin(){
    final snackbar =  SnackBar(
      content: Text("Email : $_email, password : $_password"),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          //key: formkey,
                  child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email"
                ),
                validator: (val) =>
                !val.contains("@") ? 'Invalid Email': null,
                onSaved: (val) => _email = val,
              ), 
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password"
                ),
                validator: (val) => 
                val.length < 8 ? "Password too short" : null,
                obscureText: true,
              ),
              RaisedButton(
                child: Text("login"),
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
//r"""abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~""";

// "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~"