import 'package:firebase_auth/firebase_auth.dart' ;
import 'package:flutter/material.dart';
import 'package:port_app/providers/login_provider.dart';
import 'package:port_app/register_user_screen.dart';
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
                Text(
                  "Welcome back, ${FirebaseAuth.instance.currentUser?.uid}",
                  style: TextStyle(fontSize: 24),
                ),

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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },

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

                          keyboardType: TextInputType.visiblePassword,

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
                          onPressed: () {},
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
                            value.logout();
                          },
                          child: value.isLoading
                              ? CircularProgressIndicator()
                              : Text("logout"),
                        ),
                      ),

                      Consumer<LoginProvider>(
                        builder: (context, value, child) => InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RegisterUserScreen(),
                              ),
                            );
                          },
                          child: value.isLoading
                              ? CircularProgressIndicator()
                              : Text("Signup"),
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
