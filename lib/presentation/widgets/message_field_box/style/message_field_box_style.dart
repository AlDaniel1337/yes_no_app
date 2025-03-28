import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';

///  Decoración
///+ [context]: contexto de la aplicación 
messageFieldBoxStyle({ 
  required BuildContext context,
  VoidCallback? onPressed,
}){

  // Linea: estilo
  final underlineInputBorder = UnderlineInputBorder( 
    borderSide: BorderSide( color: AppTheme.getPrimaryColor(context) ),
    borderRadius: BorderRadius.circular( 40 )
  );

  // Definición de la decoración
  final decoration = InputDecoration(
    filled: true,
    enabledBorder: underlineInputBorder,
    focusedBorder: underlineInputBorder,
    hintText: "End your message with a '?'",
    suffixIcon: IconButton(
      icon: const Icon( Icons.send_outlined ),
      onPressed: onPressed,
    )
  );

  return decoration;
}