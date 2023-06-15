import 'dart:convert';
import 'dart:developer';

import 'package:fake_store_app/data/remote_data_source/models/all_product_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<AllProductModel>> fetchAllProduct(String url) async {
    // String fetchAllProductUrl = "https://fakestoreapi.com/products/category/jewelery";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return List<AllProductModel>.from(
          result.map((item) => AllProductModel.fromJson(item)));
    } else {
      log("Something went wrong");
      return [];
    }
  }
}
