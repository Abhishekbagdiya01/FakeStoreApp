import 'dart:convert';
import 'dart:developer';

import 'package:fake_store_app/data/remote_data_source/models/all_product_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<AllProductModel> fetchAllProduct() async {
    String fetchAllProductUrl = "https://fakestoreapi.com/products";

    final response = await http.get(Uri.parse(fetchAllProductUrl));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return AllProductModel.fromJson(result);
    } else {
      log("Something went wrong");
      return AllProductModel();
    }
  }
}
