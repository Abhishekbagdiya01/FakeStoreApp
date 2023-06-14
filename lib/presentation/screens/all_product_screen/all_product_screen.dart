import 'package:fake_store_app/data/remote_data_source/api/services.dart';
import 'package:fake_store_app/data/remote_data_source/models/all_product_model.dart';
import 'package:flutter/material.dart';

class AllProductScreen extends StatefulWidget {
  AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProductScreen> {
  @override
  late Future<List<AllProductModel>> arrProducts;
  void initState() {
    arrProducts = ApiServices().fetchAllProduct();

    print(arrProducts);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: ApiServices().fetchAllProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data![index].title.toString());
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
