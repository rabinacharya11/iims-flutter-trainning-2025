import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final userCtrl = TextEditingController();
  final pwCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Welcome back", style: TextStyle(fontSize: 24)),

                SizedBox(height: 16),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: userCtrl,
                        decoration: InputDecoration(
                          labelText: 'Email',

                          hintText: 'Enter your email',

                          border: OutlineInputBorder(),
                        ),

                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: "#",
                        controller: pwCtrl,
                        decoration: InputDecoration(
                          labelText: 'Password',

                          hintText: 'Enter your password',

                          border: OutlineInputBorder(),
                        ),

                        keyboardType: TextInputType.emailAddress,

                        validator: (value) {
                          if (value == null || value.length < 8) {
                            return "Enter a strong password";
                          }
                          return null;
                        },
                      ),

                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("test");
                          }
                        },
                        child: Text("Login"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
