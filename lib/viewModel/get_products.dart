
import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ty_api_gateway/model/product.dart';



class GetProducts extends StatefulWidget {

  const GetProducts({Key? key}) : super(key: key);

  @override
  _GetProductsState createState() => _GetProductsState();
}
 List<Product> products =  [];
class _GetProductsState extends State<GetProducts> {
  @override
  void initState() {
    // TODO: implement initState
    getData();
    //sleep(Duration(seconds:1));

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemBuilder: listeElemaniOlustur,
          itemCount: products.length,
        )
      ),
    );
  }
  Future getData() async {
    var request = http.Request('GET', Uri.parse('http://10.0.2.2:4445/product'));
    request.body = '''''';

    http.StreamedResponse response = await request.send();

    if(response.statusCode == 200) {
      String data = await response.stream.bytesToString();
      products = (jsonDecode(data) as List).map((e) =>  Product.fromJson(e)).toList();

      print(products[3].productName);
      //return products;
    }
    else {
      print(response.reasonPhrase);
      // return null;
    }


  }
  Widget listeElemaniOlustur(BuildContext context, int index){

    return SingleChildScrollView(
       child: Container(
         decoration: BoxDecoration(
             border: Border.all(width: 2),
             borderRadius: BorderRadius.circular(20)
         ),
         margin: EdgeInsets.all(5),
         child: ListTile(
           onTap: (){},
           title: Text(products[index].productName),
         ),
       ),
    );
  }
}
