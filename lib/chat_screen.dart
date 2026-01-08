import 'package:flutter/material.dart';
import 'package:port_app/providers/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ChatProvider>().sendMessage(
            userMsg: "Hello, help me plan a budget for retirement",
          );
        },
      ),

      body: SafeArea(
        child: Consumer<ChatProvider>(
          builder: (context, value, child) => SingleChildScrollView(
            child: Column(
              children: List.generate(value.chats.length, (index) {
                return ListTile(
                  title: Text(value.chats[index].msg),
                  leading: Text(
                    value.chats[index].isUser ? "User Message" : "AI message",
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
