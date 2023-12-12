import 'package:chatapp/screens/chat-page.dart';
import 'package:chatapp/screens/loginpage.dart';
import 'package:chatapp/screens/signuppage.dart';
import 'package:chatapp/screens/splash-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "loginpage":(context)=> LoginPage(),
        SignUpPage.id:(context)=>SignUpPage(),

        'chatpage':(context)=>ChatPage(),
        'splashscreen':(context)=>SplashScreen(),

      },
      initialRoute: "splashscreen",
    );
  }
}
