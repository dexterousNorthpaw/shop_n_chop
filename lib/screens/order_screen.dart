import "package:flutter/material.dart";

class OrderSuccessfulScreen extends StatelessWidget {
  const OrderSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Order Successful',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Order successful \n Please Proceed for payment',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
