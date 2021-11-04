
import 'package:flutter/material.dart';
import 'package:ty_api_gateway/viewModel/get_products.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}
GetProducts getProducts = new GetProducts();

class _AdminPageState extends State<AdminPage> {
  @override
  void initState() {
    // TODO: implement initState
    getProducts.getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
            //  getProducts.getProducts()
            ],
          ),
        ),
      )
    );
  }
}
