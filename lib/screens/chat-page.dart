import 'package:chatapp/constants/constantsvalues.dart';
import 'package:chatapp/models/message-model.dart';
import 'package:chatapp/widgets/chat-bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {

  final controllerrr=ScrollController();

  TextEditingController con=TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference messagee = FirebaseFirestore.instance.collection('messages');


   ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var ema=ModalRoute.of(context)!.settings.arguments;

    return StreamBuilder<QuerySnapshot>(
        stream:messagee.orderBy("createdAt",descending: true).snapshots()
        ,
        builder: (context,snapshot){
          List<MessageModel> messageList=[];
          if(snapshot.hasData){
           for(int i=0;i<snapshot.data!.docs.length;i++){
             messageList.add(MessageModel.fromJson(snapshot.data!.docs[i]));

           }
            return
              Scaffold(

                  appBar: AppBar(
                   // automaticallyImplyLeading: false,
                    backgroundColor: kprimaryColor,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(kLogo,height: 40,),
                        const Text("Chat")
                      ],
                    ),
                  ),
                  body:
                  Container(decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/8c98994518b575bfd8c949e91d20548b.jpg"),fit: BoxFit.fill
                     , opacity: 0.6)
                  ),
                    child: Column(
                      children: [
                        Expanded(
                          child:
                          ListView.builder(
                            reverse: true,
                            controller: controllerrr,
                              itemCount: messageList.length,
                              itemBuilder: (context,index){

                            return  messageList[index].id==ema? ChatBubble(messageModel: messageList[index],)
                                :ChatBubbleForFriend(messageModel: messageList[index]);
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:

                          TextField(
                            controller: con,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                               color: kprimaryColor

                                , onPressed: () {

                                 var data=con.text;
                                 messagee.add({
                                   "message":data,
                                   "createdAt":DateTime.now(),
                                   "id":ema,
                                 });
                                 con.clear();
                                 controllerrr.animateTo(
                                     0,
                                     duration: Duration(seconds: 1),
                                     curve: Curves.easeIn
                                 );

                              },
                                icon: const Icon( Icons.send),),
                              hintText: "Enter a message",
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24),borderSide:
                              const BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24),borderSide:
                              const BorderSide(color: kprimaryColor)),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              );
          }else{
            return Text("loadingg");
          }

    });
  }
}
