import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/buttonwidget.dart';
import '../widgets/customtextfield.dart';


class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);
  static String id="signuppage";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email;

  String? pass;

  bool isLoading=false;

  GlobalKey<FormState> formKey=GlobalKey();

  @override
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
                  Text("Register",style: TextStyle(color: Colors.redAccent,fontSize: 28,fontWeight: FontWeight.bold,fontFamily: "Trash Talk"),),
                ],
              )
              ,
              const SizedBox(height: 20,),
              CustomFormTextField(hintText: "Enter your email",label: "E-mail",
                oncahnged: (data){
                  email=data;
                },),
              const SizedBox(height: 10,),
              CustomFormTextField(hintText: "enter your password",label: "Password"
                ,oncahnged: (data){
                  pass=data;
                },),
              const SizedBox(height: 30,),

              Button(buttonName: "Register",
                  ontabb: () async {

                    var auth = FirebaseAuth.instance;

                    if(formKey.currentState!.validate()){
                      isLoading=true;
                      setState(() {

                      });
                      try {
                        await registerUser(auth);
                        showSnackbar(context, "success");
                        Navigator.pushNamed(context, "loginpage");
                        // print(user.user!.displayName);

                      }
                      on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackbar(context,"weak Password");
                        } else if (e.code == 'email-already-in-use') {
                          showSnackbar(context, "email alraedy in use");
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
                  const Text("already have an account ? ",style: TextStyle(fontSize: 18),),
                  GestureDetector(onTap: (){
                    Navigator.pop(context);
                  },
                      child: TextButton( onPressed: () {
                        Navigator.pushNamed(context, "loginpage");
                      }, child: const Text('Login ',style: TextStyle(color: Colors.redAccent,fontSize: 18,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),))
                  ,
                  )],)
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

  Future<void> registerUser(FirebaseAuth auth) async {
    UserCredential user = await auth
        .createUserWithEmailAndPassword(
      email: email!,
      password: pass!,
    );
  }
}