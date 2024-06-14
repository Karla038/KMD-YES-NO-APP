import 'package:flutter/material.dart';
import 'package:kmd_yes_no_app/presentation/widgets/chat/her_message.dart';
import 'package:kmd_yes_no_app/presentation/widgets/chat/my_message.dart';
import 'package:kmd_yes_no_app/presentation/widgets/shared/message_field_box.dart';


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
    return SafeArea(
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: 
              ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index  ){
                  return (index % 2 == 0) ? const MyMessage() : const HerMessage();

                 // if(index % 2 == 0){
                 //   return const MyMessage();
                //  }
                //  return const HerMessage();
              }
              )
            ),
            const MessageFieldBox()
          ]
        ),
      ),
    );
  }
}

