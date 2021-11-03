
import 'package:flutter/material.dart';
import 'package:ty_api_gateway/model/user.dart';
import 'package:ty_api_gateway/view/admin_page.dart';
import 'package:ty_api_gateway/view/sign_up.dart';
import 'package:ty_api_gateway/view/user_homepage.dart';
import 'package:ty_api_gateway/viewModel/user_signup.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  bool otoControl=false;
  User user = new User(fullName: '', email: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.orangeAccent.shade200,
        centerTitle: true,
        title: Text("E-Commerce Login", style: TextStyle(color: Colors.white),),
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

              SizedBox(height: 20),

              //user == null ? Container() : Text("The user ${user!.fullName} is created at ${user!.email}"),
              Padding(

                padding: const EdgeInsets.only(),
                child: TextButton(onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => SignUp()));
                }, child: Text("If you are not registered, click to register. ",
                    style: TextStyle(color: Colors.orangeAccent)),),
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 20),
                    ),
                    // icon: Icon(Icons.save),
                    color: Colors.cyan,
                    textColor: Colors.white,
                    onPressed: () {

                    if(user.fullName == "admin"){
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => AdminPage()));
                    }else{Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => UserHomePage()));

                    }

                    }),
              ),

            ],
          ),
        ),
      ),
    );
  }


}

