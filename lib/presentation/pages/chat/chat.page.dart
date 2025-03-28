import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/pages/chat/components/chat_view.dart';

class ChatPage extends StatelessWidget {

  static String route = "/chat";
   
  const ChatPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chat Page'),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all( 4.0 ),
            child: GestureDetector(
              child: CircleAvatar()
            ),
          ),
        ),
         
        body: const ChatView()
      ),
    );
  }
}