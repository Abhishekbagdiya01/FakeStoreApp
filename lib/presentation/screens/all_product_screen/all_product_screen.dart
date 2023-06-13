import 'package:fake_store_app/data/remote_data_source/api/services.dart';
import 'package:flutter/material.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProductScreen> {
  @override
  void initState() {
    // TODO: implement initState

    ApiServices().fetchAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)),
    );
  }
}
