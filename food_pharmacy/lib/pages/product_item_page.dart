import 'package:flutter/material.dart';
import '../components/custom_pop_menu.dart';
import '../pages/products/products_page.dart';

class ProductItemPage extends StatelessWidget {
  static String routeName = "/product_item_page";
  List<Map<String, String>> items = [
    {'title': 'Natural Herbs'},
    {'title': 'Snacks/Drinks'},
    {'title': 'Supplies'},
    {'title': 'Natural Herbs'},
    {'title': 'Snacks/Drinks'},
    {'title': 'Supplies'},
    {'title': 'Natural Herbs'},
    {'title': 'Snacks/Drinks'},
    {'title': 'Supplies'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              CustomPopMenu(),
            ],
          ),
          body: ListView(
            children: [
              Container(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, ProductsPage.routeName);
                      },
                      child: ListTile(
                        leading: Text('${index + 1}'),
                        title: Text(items[index]['title']),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.green,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
