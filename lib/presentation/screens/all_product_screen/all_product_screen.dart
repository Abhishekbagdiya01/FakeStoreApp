import 'package:fake_store_app/data/remote_data_source/api/services.dart';
import 'package:fake_store_app/data/remote_data_source/models/all_product_model.dart';
import 'package:fake_store_app/presentation/screens/const/colors.dart';
import 'package:fake_store_app/presentation/screens/const/string_length_fix.dart';
import 'package:fake_store_app/presentation/screens/view_product_screen/view_product_screen.dart';
import 'package:fake_store_app/presentation/screens/widgets/blank_spaces.dart';
import 'package:fake_store_app/presentation/screens/widgets/store_button.dart';
import 'package:fake_store_app/presentation/screens/widgets/text_styles.dart';
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
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 300,
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final fetchedSnapshotData = snapshot.data![index];
                return InkWell(
                  onTap: () {
                    {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ViewProductScreen(
                            index: index,
                            snapshotData: fetchedSnapshotData,
                          );
                        },
                      ));
                    }
                  },
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Column(
                        children: [
                          Hero(
                            tag: index,
                            child: Image.network(
                              fetchedSnapshotData.image.toString(),
                              height: 100,
                            ),
                          ),
                          VerticalSpaceBox(height: 10),
                          Text(
                            fixLength(fetchedSnapshotData.title.toString(), 30),
                            style: TextStyle14(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          VerticalSpaceBox(height: 10),
                          Text(
                            fixLength(
                                fetchedSnapshotData.description.toString(), 60),
                            style: TextStyle14(
                                color: Colors.black.withOpacity(0.7)),
                          ),
                          VerticalSpaceBox(height: 10),
                          ListTile(
                            title: Text(
                              "\$" + fetchedSnapshotData.price.toString(),
                              style: TextStyle22(fontWeight: FontWeight.bold),
                            ),
                            trailing: StoreButton(
                              height: 30,
                              width: 30,
                              text: "+",
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
