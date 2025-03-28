import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/data/providers/chat_provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/pages/chat/components/her_message_bubble.dart';
import 'package:yes_no_app/presentation/pages/chat/components/message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/message_field_box/message_field_box.dart';

class ChatView extends StatelessWidget {
   
  const ChatView({super.key});
  
  @override
  Widget build(BuildContext context) {

    //* Obtener provider 
    final chatProvider = context.watch<ChatProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10 ),
      child: Column(
        children: [
          
          // Chat
          Expanded(
            child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index){
                final message = chatProvider.messages[index];
                return message.fromWho == FromWho.me 
                  ? MessageBubble( message: message ) 
                  : HerMessageBubble( message: message );
              }
                
            )
          ),

          // Caja para envio de texto
          MessageFieldBox(
            onValue: (message) => chatProvider.sendMessage(message),
          )
        ],
      ),
    );
  }
}