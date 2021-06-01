import 'package:flutter/material.dart';
import 'package:foodpharmacy/media_config.dart';

import '../../product_detail/product_detail_page.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: Column(
          children: [
            kProductSearch(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    kMainSlider(),
                    kProducts(),
                    kRelatedListing(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget kProductSearch() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
    );
  }

  Widget kMainSlider() {
    return Container(
      height: MediaConfig.screenWidth * 0.5,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(15)),
            child: Container(
              width: MediaConfig.screenWidth * 0.8,
              color: Colors.green,
              child: Image(
                image: AssetImage(
                  'assets/images/banner.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget kProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: getProportionateScreenWidth(10)),
        Text(
          'Products',
          style: TextStyle(
            color: Colors.green,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductDetailPage.routeName);
          },
          child: Container(
            height: MediaConfig.screenWidth * 0.52,
            child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0, top: 5.0, bottom: 5.0, left: 5.0),
                  child: Container(
                    width: MediaConfig.screenWidth * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: getProportionateScreenWidth(15),
                        ),
                        Container(
                          height: MediaConfig.screenWidth * 0.25,
                          child: Image(
                            image: AssetImage('assets/images/image_pro_3.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10)),
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.7,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Olive Oil',
                            ),
                            Text(
                              '\$115.00',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget kRelatedListing() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Related Listing',
            style: TextStyle(
              color: Colors.green,
              fontSize: getProportionateScreenWidth(20),
            ),
          ),
          Container(
            height: MediaConfig.screenWidth * 0.6,
            child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0, top: 5.0, bottom: 5.0, left: 5.0),
                  child: Container(
                    width: MediaConfig.screenWidth * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: getProportionateScreenWidth(15)),
                        Container(
                          height: MediaConfig.screenWidth * 0.25,
                          child: Image(
                            image: AssetImage('assets/images/health.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10)),
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.7,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'CrossFit',
                            ),
                            Text('Gym, Spa'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.green,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
