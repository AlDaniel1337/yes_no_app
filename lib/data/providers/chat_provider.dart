import 'package:flutter/material.dart';
import 'package:yes_no_app/data/services/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  // Manejo del Scroll
  final ScrollController chatScrollController = ScrollController();

  // Peticion a YesNo 
  final yesNoAnswer = GetYesNoAnswer();

  // Almacenar mensajes
  List<Message> messages = [
    Message( text: "Sint laboris ex velit enim pariatur.", fromWho: FromWho.me ),
    Message( text: "Cillum dolor sint cillum nisi magna magna cupidatat.", fromWho: FromWho.me ),
  ];

  /// Enviar y almacenar nuevo mensaje
  Future<void> sendMessage( String message ) async {
    if(message.isEmpty) return;
    // Crear nuevo mensaje
    final newMessage = Message(text: message, fromWho: FromWho.me);
    // Agregar nuevo mensaje a la lista
    messages.add( newMessage );

    if(message.endsWith("?")){
      herReply();
    }
    else{
      // Notificar cambios
      notifyListeners();
      moveScrollToBottom();
    }
  }

  /// Obtener imagen de YesNo
  Future<void> herReply() async {
    final herMessage = await yesNoAnswer.getAnswer();
    // Agregar nuevo mensaje a la lista
    messages.add( herMessage );
    // Notificar cambios
    notifyListeners();
    moveScrollToBottom();
  }

  /// Mover Scroll al final de la pantalla
  Future<void> moveScrollToBottom() async {

    await Future.delayed( const Duration( milliseconds: 100) );

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, // Posición a la cual ir
      duration: Duration( milliseconds: 300), // Duración
      curve: Curves.easeOut, // Tipo de animación
    );
  }



}