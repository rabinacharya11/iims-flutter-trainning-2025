import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final auth = FirebaseAuth.instance;

  bool _showPassword = false;
  bool get showPassword => _showPassword;

  void togglePasswordView() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  // String  value tarika
  String _loginButtonText = "Login 1234";
  String get loginText => _loginButtonText;

  void loginTextChange() {
    _loginButtonText = "hey fdgfdg";
    notifyListeners();
  }

  /// bool used

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  void changeLoginText() {
    _isLoggedIn = true;

    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _loginError = "";
  String get loginError => _loginError;

  Future login() async {
    _isLoading = true;
    notifyListeners();

    try {
      await auth.createUserWithEmailAndPassword(
        email: "test@gmail.com",
        password: "password",
      );

      await auth.signInWithEmailAndPassword(
        email: "test@gmail.com",
        password: "password",
      );

      auth.signOut();

     

      _isLoading = false;
      debugPrint("Came here");
    } catch (e) {
      _loginError = '';
      _isLoading = false;
    }

    notifyListeners();
  }
}
