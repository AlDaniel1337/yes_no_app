import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {

  final Message message;
   
  const HerMessageBubble({
    super.key, 
    required this.message
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          decoration: BoxDecoration(
            color: AppTheme.getSecondaryColor(context),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: TextStyle( color: Colors.white ),),
          ),
        ),

        const SizedBox( height: 5 ),
        _ImageBubble(message: message,)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {

  final Message message;
   
  const _ImageBubble({
    required this.message
  });
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image( 
        image: NetworkImage(message.imageUrl ?? ''),
        width: size.width * 0.5,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {

          //+ Regresar imagen si ya se cargo
          //if(loadingProgress == null) return child;

          return Container(
            width: size.width * 0.5,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Center(
              child: Text("Cargando...")
            )
          );

        },
      ),
    );
  }
}