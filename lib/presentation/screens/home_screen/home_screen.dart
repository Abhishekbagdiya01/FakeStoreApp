import 'package:fake_store_app/data/remote_data_source/api/apis.dart';
import 'package:fake_store_app/presentation/screens/all_product_screen/all_product_screen.dart';
import 'package:fake_store_app/presentation/screens/const/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/blank_spaces.dart';
import '../widgets/text_styles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<Widget> tabCat = [
    Text(
      "All",
      style: TextStyle22(),
    ),
    Text(
      "electronics",
      style: TextStyle22(),
    ),
    Text(
      "jewelery",
      style: TextStyle22(),
    ),
    Text(
      "men's clothing",
      style: TextStyle22(),
    ),
    Text(
      "women's clothing",
      style: TextStyle22(),
    ),
  ];

  List<Widget> tabScreens = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: backgroundWhiteColor,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: backgroundWhiteColor,
            elevation: 0,
            title: Text(
              "ShopKart",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        body: Column(
          children: [
            VerticalSpaceBox(height: 10),
            SizedBox(
              // width: MediaQuery.of(context).size.width,
              child: TabBar(isScrollable: true, tabs: tabCat),
            ),
            VerticalSpaceBox(height: 20),
            Expanded(
                child: TabBarView(children: [
              AllProductScreen(url: allProductsURL),
              AllProductScreen(url: catElectronicsURL),
              AllProductScreen(url: catJewelryURL),
              AllProductScreen(url: catMenClothingURL),
              AllProductScreen(url: catWomenClothingURL),
            ]))
          ],
        ),
      ),
    );
  }
}
