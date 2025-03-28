import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/message_field_box/style/message_field_box_style.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged<String> onValue;
   
  const MessageFieldBox({
    super.key, 
    required this.onValue
  });
  
  @override
  Widget build(BuildContext context) {

    // Controlador del text field
    final textController = TextEditingController();
    // Manejo del focus
    final focusNode = FocusNode();

    return TextFormField(
      focusNode: focusNode,
      controller: textController,
      decoration: messageFieldBoxStyle(
        context: context,
        onPressed: () {
          final textValue = textController.value.text;//? Obtener texto
          textController.clear(); //? Limpiar contenido
          onValue( textValue ); //! Retornar el texto escrito
        },
      ),
      onChanged: (value) {},
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus(); //? Mantener focus
        onValue( value ); //! Retornar el texto escrito
      },
      onTapOutside: (event) {
        focusNode.unfocus(); //? Quitar el focus
      },
    );
  }
}