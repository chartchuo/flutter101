import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final keyForm = GlobalKey<FormState>();

  var email = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Form(
          key: keyForm,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: emailValidator,
                onSaved: (input) {
                  email = input ?? '';
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'password'),
                obscureText: true,
                onSaved: (input) {
                  password = input ?? '';
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (keyForm.currentState?.validate() == true) {
                    keyForm.currentState?.save();
                    print(email);
                    print(password);
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String? emailValidator(String? input) {
  if (input == null || input.isEmpty) return 'Please enter email address.';
  if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(input)) return 'Please enter valid email address.';
}
