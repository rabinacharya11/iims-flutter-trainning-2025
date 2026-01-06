import 'package:flutter/material.dart';
import 'package:port_app/providers/http_provider.dart';
import 'package:provider/provider.dart';

class HttpTestScreen extends StatelessWidget {
  const HttpTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HttpProvider>().getPosts();
        },
      ),
      body: Center(
        child: Consumer<HttpProvider>(
          builder: (context, value, child) => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(value.allPosts.length, (index) {
                final dt = value.allPosts[index];
                return ListTile(
                  title: Text(dt['title']),

                  leading: Text(dt['id'].toString()),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
