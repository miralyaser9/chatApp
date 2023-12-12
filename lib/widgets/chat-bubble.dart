import 'package:chatapp/models/message-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.messageModel}) : super(key: key);
   final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.redAccent,Colors.white54],begin: Alignment.topCenter,end: Alignment.centerRight),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            )),
        child: Padding(
          padding: const EdgeInsets.only(top: 32,left: 16,right: 16,bottom: 16),
          child: Text(messageModel.text,style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}


class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({Key? key, required this.messageModel}) : super(key: key);
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red,Colors.black],begin: Alignment.topCenter,end: Alignment.centerRight),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32),
              topLeft: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            )),
        child: Padding(
          padding: const EdgeInsets.only(top: 32,left: 16,right: 16,bottom: 16),
          child: Text(messageModel.text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
        ),
      ),
    );
  }
}