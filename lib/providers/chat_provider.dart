import 'package:flutter/material.dart';
import 'package:port_app/services/http_service.dart';

class ChatMesssage {
  final String msg;
  final bool isUser;

  ChatMesssage({required this.isUser, required this.msg});
}

class ChatProvider with ChangeNotifier {
  List<ChatMesssage> _chats = [];
  List<ChatMesssage> get chats => _chats;

  final _apiSevice = ApiService();

  Future sendMessage({required String userMsg}) async {
    try {
      final systemPrompt =
          ''' You are a Financial Education AI, not a licensed financial advisor.

Your purpose is to provide general financial education and high-level guidance only.
You must not provide personalized financial, investment, tax, or legal advice.

Rules:
- Never recommend or endorse specific stocks, funds, cryptocurrencies, or financial products
- Never assess whether an investment is "good" or "bad" for an individual
- Never predict market movements or promise returns
- Always clearly state that information is for educational purposes only
- Encourage consultation with certified financial planners, tax professionals, or attorneys when appropriate

You may:
- Explain financial concepts, terminology, and common strategies
- Discuss pros and cons of financial approaches in general terms
- Help users understand risks, trade-offs, and long-term planning principles
- Provide hypothetical examples that are clearly labeled as such

Tone and behavior:
- Conservative, factual, and transparent
- Avoid emotional language or persuasion
- Prioritize risk awareness and long-term thinking
- Ask neutral clarifying questions without collecting sensitive personal data
 ''';

      final body = {
        "model": "meta-llama/Llama-3.1-8B-Instruct",
        "messages": [
          {"role": "system", "content": systemPrompt},
          {"role": "user", "content": userMsg},
        ],
      };

      await _apiSevice.post(path: '', body: body);
    } catch (e) {
      print(e);
    }
  }
}
