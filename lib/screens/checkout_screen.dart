import 'package:flutter/material.dart';
import 'package:shop_n_chop/screens/order_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final List<String> checkoutItems;
  final Function(String) onRemoveItem;
  final List<String> productsImages;

  CheckoutScreen(
      {required this.checkoutItems,
      required this.onRemoveItem,
      required this.productsImages});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: checkoutItems.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(checkoutItems[index]),
                    // leading: Image.asset(
                    //     fit: BoxFit.cover,
                    //     height: 100,
                    //     width: 100,
                    //     productsImages[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.cancel),
                      onPressed: () {
                        onRemoveItem(checkoutItems[index]);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => OrderSuccessfulScreen()),
            );
          },
          child: const Text('Place Order'),
        ),
      ],
    );
  }
}
