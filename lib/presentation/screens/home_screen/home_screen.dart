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
          title: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 216, 216, 216),
                borderRadius: BorderRadius.circular(6)),
            child: ListTile(
              title: Text(
                "Search for a product ",
                style: TextStyle(
                  color: textBlackColor.withOpacity(0.4),
                ),
              ),
              trailing: Icon(Icons.search),
            ),
          ),
        ),
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
              AllProductScreen(),
              Text("electronics"),
              Text("jewelery"),
              Text("men's clothing"),
              Text("women's clothing"),
            ]))
          ],
        ),
      ),
    );
  }
}
