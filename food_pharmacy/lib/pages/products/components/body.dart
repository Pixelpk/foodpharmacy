import 'package:flutter/material.dart';
import 'package:foodpharmacy/media_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                hintText: 'Product Name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(10),
            ),
            Text(
              'Products',
              style: TextStyle(
                color: Colors.green,
                fontSize: getProportionateScreenWidth(20),
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  GridView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: (30 / 38),
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, left: 5.0, right: 5.0, bottom: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: getProportionateScreenWidth(10),
                                ),
                                Image(
                                  height: MediaConfig.screenHeight * 0.15,
                                  image: AssetImage(
                                      'assets/images/image_pro_3.png'),
                                  fit: BoxFit.fitHeight,
                                ),
                                SizedBox(
                                  height: getProportionateScreenWidth(5),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Turpis at iaculis',
                                    ),
                                    Text(
                                      '\$115.00',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenWidth(10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
