import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
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

  void login() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));

    _isLoading = false;
    notifyListeners();
  }
}
