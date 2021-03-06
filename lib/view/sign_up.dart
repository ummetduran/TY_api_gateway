
import 'package:flutter/material.dart';
import 'package:ty_api_gateway/model/user.dart';
import 'package:ty_api_gateway/view/sing_in.dart';
import 'package:ty_api_gateway/viewModel/user_signup.dart';


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
                      
                      UserSignUp add = new UserSignUp(user);

                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => SignIn()));

                    }),
              ),

            ],
          ),
        ),
      ),
    );
  }


}
