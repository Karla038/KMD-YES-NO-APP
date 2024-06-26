import 'package:flutter/material.dart';
import 'package:kmd_yes_no_app/domain/entities/message.dart';
import 'package:kmd_yes_no_app/presentation/providers/chat_provider.dart';
import 'package:kmd_yes_no_app/presentation/widgets/chat/her_message.dart';
import 'package:kmd_yes_no_app/presentation/widgets/chat/my_message.dart';
import 'package:kmd_yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';




class ChatScreen extends StatelessWidget{
  const ChatScreen({super.key});

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA=w240-h480-rw'),
          ),
        ),
        title: const Text('Usuario'),
        centerTitle: false,
      ),
      body:  _ChatView(),
    );
  }

}

class _ChatView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: 
              ListView.builder(
                controller:chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index  ){
                  //return (index % 2 == 0) ? const MyMessage() : const HerMessage();
                  final message = chatProvider.messages[index];
                  return (message.fromWho == FromWho.me) 
                  ?  MyMessage(message:message)
                  :  HerMessage( message: message,);

                 // if(index % 2 == 0){
                 //   return const MyMessage();
                //  }
                //  return const HerMessage();
              }
              )
            ),
            MessageFieldBox(
            //onValue:(value)=> chatProvider.sendMessages(value),)
            onValue: chatProvider.sendMessage,
            ),
          ]
        ),
      ),
    );
  }
}

