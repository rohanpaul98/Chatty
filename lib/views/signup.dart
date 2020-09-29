import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/services/auth.dart';
import 'package:project/widgets/widget.dart';
import 'package:project/views/chatroomscreen.dart';
import'package:project/services/database.dart';

class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp(this.toggle);
  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {

  bool isLoading = false;
  AuthMethods authMethods  = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formkey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();


  signMeUp(){
    if(formkey.currentState.validate()){
      Map<String, String> userInfoMap = {
        "Name": userNameTextEditingController.text,
        "Email": emailTextEditingController.text
      };
      setState(() {
        isLoading=true;
      });
      authMethods.signUpWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text).then((val) {

        databaseMethods.uploadUserInfo(userInfoMap);
         Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => ChatRoom()
          ));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: isLoading? Container(
        child: Center(
          child: CircularProgressIndicator(),),
      ):SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
               Form(
                 key: formkey,
                 child: Column(
                   children: [
                     TextFormField(
                       validator: (val){
                         return (val.isEmpty)|| (val.length<4)?"Please provide  a valid username":null;
                       },
                       controller: userNameTextEditingController,
                       style: simpleTextFieldStyle(),
                       decoration: textFieldInputDecoration("username"),
                     ),
                     TextFormField(
                       validator: (val){
                         return RegExp(
                             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                         ).hasMatch(val)?null:'enter correct email id';
                       },
                       controller: emailTextEditingController,
                       style: simpleTextFieldStyle(),
                       decoration: textFieldInputDecoration("email"),
                     ),
                     TextFormField(
                       obscureText: true,
                       validator: (val){
                         return val.length > 6 ? null:'please provide password 6+ charecters';
                       },
                       controller: passwordTextEditingController ,
                       style: simpleTextFieldStyle(),
                       decoration: textFieldInputDecoration("password"),
                     ),
                   ],
                 ),
               ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 8,
                ),

                GestureDetector(
                  onTap: (){
                    signMeUp();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          const Color(0xff007EF4),
                          const Color(0xff2A75BC)
                        ]),
                        borderRadius: BorderRadius.circular(100)),
                    child: Text("Sign Up", style: mediumTextStyle()),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    "Sign Up with google",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?  ",
                      style: mediumTextStyle(),
                    ),

                    GestureDetector(
                      onTap: (){
                        widget.toggle();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "SignIn Now!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
