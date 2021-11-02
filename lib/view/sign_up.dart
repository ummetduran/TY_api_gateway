import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ty_api_gateway/model/user.dart';
import 'package:http/http.dart' as http;


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  bool otoControl=false;
  User user = new User(fullName: '', email: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.orangeAccent.shade200,
        centerTitle: true,
        title: Text("E-Commerce", style: TextStyle(color: Colors.white),),
      ),
      body: Form(
        key: formKey,
        autovalidate: otoControl,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [


              SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_circle,
                      color: Colors.cyan,
                    ),
                    labelText: "Full Name",
                    hintText: "Enter your full name",
                    labelStyle: TextStyle(color: Colors.cyan, fontSize: 18),
                    hintStyle: TextStyle(color: Colors.cyan, fontSize: 18)),
                onChanged: (deger) => user.fullName = deger,
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.cyan,
                  ),
                  labelText: "Email",
                  hintText: "Enter your email",
                  labelStyle: TextStyle(color: Colors.cyan, fontSize: 18),
                  hintStyle: TextStyle(color: Colors.cyan, fontSize: 18),
                  //suffixStyle: TextStyle(color: Colors.white)
                ),
                onChanged: (deger) => user.email = deger,
              ),

              SizedBox(height: 60),

              //user == null ? Container() : Text("The user ${user!.fullName} is created at ${user!.email}"),
              
              SizedBox(
                height: 50,
                width: 200,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 20),
                    ),
                    // icon: Icon(Icons.save),
                    color: Colors.cyan,
                    textColor: Colors.white,
                    onPressed: () {
                      debugPrint(" user name: ${user.fullName}");
                      debugPrint("mail ${user.email}");
                      
                      postMethod();
                     /* Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => SignIn()));*/

                    }),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void postMethod() async{

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('http://10.0.2.2:4444/user'));
    request.body = json.encode({
      "fullName": "${user.fullName}",
      "email": "${user.email}"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }

  }
}
