import 'package:flutter/material.dart';
import 'package:port_app/services/http_service.dart';

class HttpProvider with ChangeNotifier {
  final _apiService = ApiService();

  bool _isGettingPosts = false;
  bool get isGettingPosts => _isGettingPosts;

  List _allPosts = [];
  List get allPosts => _allPosts;

  Future createPost() async {
    await _apiService.post(
      path: 'posts',
      body: {"id": 10111, "title": "dfdfdf", "userId": 1123, "body": "Test"},
    );
  }

  Future getPosts() async {
    _isGettingPosts = true;
    notifyListeners();
    try {
      final res = await _apiService.get(path: 'posts');
      _allPosts = res;
    } catch (e) {
      print(e);
    }

    _isGettingPosts = false;
    notifyListeners();
  }
}
