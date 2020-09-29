import 'package:flutter/material.dart';
import 'package:project/helper/auhenticate.dart';
import 'package:project/services/auth.dart';
import 'package:project/views/search.dart';
import 'package:project/views/signin.dart';
import 'package:project/widgets/widget.dart';

class ChatRoom extends StatefulWidget{
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<ChatRoom>{
  AuthMethods authMethods = new AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("asset/Images/logo.png",height: 50,),
        actions:[
          GestureDetector(
            onTap: (){
              authMethods.signOut();
              Navigator.pushReplacement(context,MaterialPageRoute(
                builder: (context) => Authenticate()
              ));
            },
            child:
              Container(
                  padding:EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.exit_to_app))
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) =>SearchScreen()
          ));
        },
      ),
    );
  }
}