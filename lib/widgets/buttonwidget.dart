import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({Key? key,required this.buttonName,required this.ontabb}) : super(key: key);
  String buttonName;
  VoidCallback ontabb;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: ontabb,
      child: Container(
        width: double.infinity,height: 30,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
            color: Colors.redAccent),
        child: Center(child: Text(buttonName,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
        ),
      ),
    );
  }
}
