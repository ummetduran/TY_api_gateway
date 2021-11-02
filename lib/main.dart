import 'package:flutter/material.dart';
import 'package:ty_api_gateway/view/sign_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //initialRoute: '/SignIn',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.indigo
      ),
      darkTheme: ThemeData(
          primarySwatch: Colors.deepPurple,
          brightness: Brightness.dark
      ),
      themeMode: ThemeMode.system,
      routes: {
        '/SignUp' :(context) => SignUp(),

      },
      home: Scaffold(
          resizeToAvoidBottomInset: false,



          body: SignUp()
      ),
    );
  }
}
