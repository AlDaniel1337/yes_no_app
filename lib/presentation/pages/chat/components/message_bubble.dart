import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MessageBubble extends StatelessWidget {

  final Message message;
   
  const MessageBubble({
    super.key, 
    required this.message
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

        Container(
          decoration: BoxDecoration(
            color: AppTheme.getPrimaryColor(context),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: TextStyle( color: Colors.white ),),
          ),
        ),

        const SizedBox( height: 10 )
      ],
    );
  }
}