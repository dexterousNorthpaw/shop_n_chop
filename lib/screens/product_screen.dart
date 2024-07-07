import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  final List<String> products;
  final Function(String) onAddItem;
  final List<String> productsImages;

  const ProductsScreen(
      {super.key,
      required this.products,
      required this.onAddItem,
      required this.productsImages});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: productsImages.length,
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, index) {
        return GridTile(
          child: Card(
            // color: Colors.,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    productsImages[index],
                    height: 100,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    products[index],
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Add to Cart",
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.add,
                          // color: Colors.white
                        ),
                        onPressed: () {
                          onAddItem(products[index]);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
