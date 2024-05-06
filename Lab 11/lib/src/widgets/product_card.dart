import 'package:flutter/material.dart';

import './extensions.dart';
import '../../src/model/product.dart';
import '../../src/themes/light_color.dart';
import '../../src/widgets/title_text.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final ValueChanged<Product> onSelected;
  const ProductCard({Key? key, required this.product, required this.onSelected})
      : super(key: key);

//   @override
//   _ProductCardState createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   Product product;
//   @override
//   void initState() {
//     product = widget.product;
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: LightColor.background,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.transparent, blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: !product.isSelected ? 20 : 0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                icon: Icon(
                  product.isliked ? Icons.favorite : Icons.favorite_border,
                  color:
                      product.isliked ? LightColor.red : LightColor.iconColor,
                ),
                onPressed: () {},
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: product.isSelected ? 15 : 0),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: LightColor.lightBlue.withAlpha(40),
                      ),
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: Image.asset(
                          product.image,
                        ),
                      )
                    ],
                  ),
                ),
                // SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: TitleText(
                      text: product.name,
                      fontSize: product.isSelected ? 20 : 18,
                    ),
                  ),
                ),
                Center(
                  child: TitleText(
                    text: product.category,
                    fontSize: product.isSelected ? 16 : 14,
                    color: LightColor.orange,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: TitleText(
                      text: product.price.toString(),
                      fontSize: product.isSelected ? 20 : 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ).ripple(() {
        Navigator.of(context).pushNamed('/detail');
        onSelected(product);
      }, borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }
}
