import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ty_api_gateway/model/user.dart';

class UserSignUp{
 // late User user;

  UserSignUp(User user){
    postMethod(user);
  }

  void postMethod(User user) async{

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