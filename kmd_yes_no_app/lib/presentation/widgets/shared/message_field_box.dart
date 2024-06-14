import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox ({super.key});

  @override
  Widget build(BuildContext context) {

    final textController = TextEditingController();
    final focus = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20)
    );

    final inputDecoration = InputDecoration(
      hintText: 'Escribe tu mensaje, debe terminar en "?"',
      enabledBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: (){
          final textValue = textController.value.text;
          print('Envio desde el boton $textValue');
          textController.clear();
        }, 
        icon:const Icon(Icons.send_rounded)
        )
    );

    return TextFormField(
      focusNode: focus,

      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        final textValue = textController.value.text;
        print('Envio desde el boton submit (keyboard) $textValue');
        textController.clear();
        focus.requestFocus();
      },
      onTapOutside: (value){
        focus.unfocus();
      }
    );
  }
}