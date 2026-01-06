import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;

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

  Future login({required String email, required String password}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(user);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      debugPrint(e.toString());
    }
  }

  Future signUp({required String email, required String password}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(user);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      debugPrint(e.toString());
    }
  }

  void logout() async {
    try {
      _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
