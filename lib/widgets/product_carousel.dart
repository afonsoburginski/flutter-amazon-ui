import 'package:amazon_ui/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCarousel extends StatelessWidget {
  final String title;
  final List<Product> products;

  const ProductCarousel({
    Key? key,
    required this.title,
    required this.products,
  }) : super(key: key);

  _buildProductCard(int index) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      width: 150.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Image(
              image: AssetImage(products[index].imageUrl),
              height: 100.0,
              width: 150.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            products[index].name,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  '\$${products[index].price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                FlatButton(
                  padding: const EdgeInsets.all(4.0),
                  onPressed: () => print('Add to cart'),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 280.0,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildProductCard(index);
            },
          ),
        ),
      ],
    );
  }
}
