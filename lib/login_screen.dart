import 'package:flutter/material.dart';
import 'package:port_app/providers/login_provider.dart';
import 'package:provider/provider.dart';

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
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',

                          hintText: 'Enter your email',

                          border: OutlineInputBorder(),
                        ),

                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),
                      Consumer<LoginProvider>(
                        builder: (context, value, child) => TextFormField(
                          obscureText: !value.showPassword,
                          obscuringCharacter: "#",
                          controller: pwCtrl,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.password),
                            suffixIcon: InkWell(
                              onTap: () => value.togglePasswordView(),
                              child: Icon(
                                !value.showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),

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
                      ),

                      // String bata change garne method
                      Consumer<LoginProvider>(
                        builder: (context, value, child) => TextButton(
                          onPressed: () {
                            value.loginTextChange();
                          },
                          child: Text(value.loginText),
                        ),
                      ),

                      SizedBox(height: 32),

                      Consumer<LoginProvider>(
                        builder: (context, value, child) => TextButton(
                          onPressed: () {
                            value.changeLoginText();
                          },
                          child: Text(value.isLoggedIn ? "Logged In" : "Login"),
                        ),
                      ),

                      SizedBox(height: 32),

                      Consumer<LoginProvider>(
                        builder: (context, value, child) => InkWell(
                          onTap: () {
                            value.login();
                          },
                          child: value.isLoading
                              ? CircularProgressIndicator()
                              : Text("Login"),
                        ),
                      ),

                      ///
                      ///
                      ///
                      ///
                      ///
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
