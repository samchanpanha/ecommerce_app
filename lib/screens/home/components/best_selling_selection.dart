import 'package:flutterecommerceapp/components/card_body.dart';
import 'package:flutterecommerceapp/components/product_card_bottom.dart';
import 'package:flutterecommerceapp/models/products_model.dart';
import 'package:flutterecommerceapp/screens/details/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class BestSellingSection extends StatelessWidget {
  const BestSellingSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: SizeConfig.getScreenPropotionHeight(300),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CardBody(
            width: SizeConfig.getScreenPropotionWidth(298),
            height: SizeConfig.getScreenPropotionHeight(300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 19,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    bestSelling[index].name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    bestSelling[index].modelNo,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          bestSelling[index].description,
                          style: TextStyle(
                            color: kTextLightColor,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Hero(
                            tag: bestSelling[index].id,
                            child: Image.asset(
                              bestSelling[index].images[0],
                              width: SizeConfig.getScreenPropotionWidth(100),
                              height: SizeConfig.getScreenPropotionHeight(170),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ProductCardBottom(
                    product: bestSelling[index],
                  ),
                )
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(
                    product: bestSelling[index],
                  ),
                ),
              );
            },
            index: index,
          );
        },
        itemCount: bestSelling.length,
      ),
    );
  }
}
