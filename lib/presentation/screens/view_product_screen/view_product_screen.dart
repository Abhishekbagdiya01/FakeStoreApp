import 'package:cached_network_image/cached_network_image.dart';
import 'package:fake_store_app/presentation/screens/widgets/blank_spaces.dart';
import 'package:fake_store_app/presentation/screens/widgets/store_button.dart';
import 'package:fake_store_app/presentation/screens/widgets/text_styles.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class ViewProductScreen extends StatelessWidget {
  ViewProductScreen({required this.snapshotData, required this.index});
  final snapshotData;
  final index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundWhiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: Text(
          "Product Details",
          style: TextStyle22(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            VerticalSpaceBox(height: 10),
            Expanded(
                flex: 4,
                child: Hero(
                    tag: index,
                    child: CachedNetworkImage(imageUrl: snapshotData.image))),
            VerticalSpaceBox(height: 10),
            Chip(
              label: Text(snapshotData.category),
            ),
            VerticalSpaceBox(height: 10),
            Text(
              snapshotData.title,
              style: TextStyle22(fontWeight: FontWeight.bold),
            ),
            VerticalSpaceBox(height: 10),
            Text(
              snapshotData.description,
              style: TextStyle14(color: Colors.black.withOpacity(0.5)),
            ),
            VerticalSpaceBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "\$" + snapshotData.price.toString(),
                  style: TextStyle22(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Rating : " + snapshotData.rating.rate.toString() + "/5",
                  style: TextStyle22(),
                ),
              ],
            ),
            VerticalSpaceBox(height: 10),
            StoreButton(
                voidCallBack: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      content: Text("Product added to the cart")));
                },
                text: "Add to cart",
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8),
            VerticalSpaceBox(height: 10),
          ],
        ),
      ),
    );
  }
}
