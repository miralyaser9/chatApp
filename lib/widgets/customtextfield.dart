import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({Key? key,required this.hintText,required this.label,this.oncahnged,this.obsecurTex=false}) : super(key: key);
  String hintText,label;
  Function(String)? oncahnged;
  bool? obsecurTex;
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      obscureText:obsecurTex! ,
      validator: (data){
        if(data!.isEmpty){
          return "this field is required";
        }
      },
      onChanged: oncahnged,
      decoration: InputDecoration(labelText: label,
          hintText: hintText,hintStyle: TextStyle(color: Colors.black),
          enabledBorder:
          const OutlineInputBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(38))
          )
          ,focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.redAccent))
      ),
    );
  }
}