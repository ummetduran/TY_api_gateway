
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ty_api_gateway/model/product.dart';

class GetProducts{

  Widget getProducts(){
    return ListView(

    );
}

void getData() async {
  var request = http.Request('GET', Uri.parse('http://10.0.2.2:4445/product'));
  request.body = '''''';

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
  print(response.reasonPhrase);
  }

}
}