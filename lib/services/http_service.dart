import 'dart:convert';

import 'package:http/http.dart' as network;

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  Future post({
    required String path,
    required Map<String, dynamic> body,
  }) async {
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer dfdghkjdhgjdg",
    };
    try {
      Uri uri = Uri.parse("$baseUrl/$path");
      final jsonBody = jsonEncode(body);
      final res = await network.post(uri, body: jsonBody, headers: headers);
      print(res.body);
      final resBody = jsonDecode(res.body);
      print(resBody);
    } catch (e) {
      print(e);
    }
  }

  Future get({required String path}) async {
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer dfdghkjdhgjdg",
    };
    try {
      Uri uri = Uri.parse("$baseUrl/$path");

      final res = await network.get(uri, headers: headers);
      print(res.body);
      final resBody = jsonDecode(res.body);
      return resBody;
    } catch (e) {
      print(e);
    }
  }

  Future getDetail() async {}

  Future delete() async {}

  Future put() async {}

  Future patch() async {}
}
