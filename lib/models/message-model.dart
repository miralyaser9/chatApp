import 'package:flutter/foundation.dart';

class MessageModel{
  String text;
  String id;
  MessageModel(this.text,this.id);

  factory MessageModel.fromJson(jsonData){
    return MessageModel(jsonData["message"],jsonData["id"]);
  }
}