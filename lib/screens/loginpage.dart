import 'package:chatapp/screens/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/buttonwidget.dart';
import '../widgets/customtextfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;

  String? pass;

  bool isLoading=false;

  GlobalKey<FormState> formKey=GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child:

        Form(
          key:formKey ,

          child: ListView(
            children: [
              const SizedBox(height: 30,),
              const Image(height: 170,image:AssetImage("assets/images.png"))

              ,
              // Text("Scholar Chat",style: TextStyle(fontSize: 30,fontFamily: "Trash Talk"),)
             const SizedBox(height: 50,),
              const Row(
                children: [
                  Text("Login",style: TextStyle(color: Colors.redAccent,fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "Trash Talk"),),
                ],
              )
              ,
              const SizedBox(height: 20,),
              CustomFormTextField(hintText: "Enter your email",label: "E-mail",
                oncahnged: (data){
                  email=data;
                },),
              const SizedBox(height: 10,),
              CustomFormTextField(obsecurTex: true,hintText: "enter your password",label: "Password"
                ,oncahnged: (data){
                  pass=data;
                },),
              const SizedBox(height: 30,),

              Button(buttonName: "Login",
                  ontabb: () async {

                    var auth = FirebaseAuth.instance;

                    if(formKey.currentState!.validate()){
                      isLoading=true;
                      setState(() {

                      });
                      try {
                        await loginUser(auth);
                        showSnackbar(context, "success");

                        Navigator.pushNamed(context, "chatpage",arguments: email);
                        // print(user.user!.displayName);

                      }
                      on FirebaseAuthException catch (e) {
                        if (e.code == 'user not found') {
                          showSnackbar(context,"user not found");
                        } else if (e.code == 'wrong password') {
                          showSnackbar(context, "wrong password");
                        }
                      }
                      catch(ex){
                        showSnackbar(context, "there was an error");
                      }
                      isLoading=false;
                      setState(() {

                      });

                    }
                    else{}
                  }
              ),


              const SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("do not have an account?  ",style: TextStyle(fontSize: 18),),
                  GestureDetector(onTap: (){
                    Navigator.pushNamed(context, SignUpPage.id);
                  },
                      child: const Text("sign up ",style: TextStyle(color: Colors.redAccent,fontSize: 18,fontWeight:FontWeight.bold,decoration: TextDecoration.underline,)))
                  ,
                ],)
              ,


            ],
          ),
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> loginUser(FirebaseAuth auth) async {
    UserCredential user = await auth
        .signInWithEmailAndPassword(
      email: email!,
      password: pass!,
    );
  }
}