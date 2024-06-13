import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                itemBuilder: (context, index){
                  return Text('Indice:  $index');
              }
              )
            ),
            const Text('Mundo')
          ]
        ),
      ),
    );
  }
}

