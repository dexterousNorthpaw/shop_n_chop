import 'package:flutter/material.dart';
import 'package:shop_n_chop/screens/checkout_screen.dart';
import 'package:shop_n_chop/screens/product_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<String> _checkoutItems = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addItem(String item) {
    setState(() {
      _checkoutItems.add(item);
    });
  }

  void _removeItem(String item) {
    setState(() {
      _checkoutItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> products = [
      'Chicken',
      'Fried Rice',
      'Jollof Rice',
      'Suya',
    ];

    List<String> productsImages = [
      "assets/chicken.jpg",
      "assets/friedrice.jpg",
      "assets/jollofjpg.jpg",
      "assets/suya.jpg",
    ];

    List<Widget> widgetOptions = <Widget>[
      ProductsScreen(
        products: products,
        onAddItem: _addItem,
        productsImages: productsImages,
      ),
      CheckoutScreen(
        checkoutItems: _checkoutItems,
        onRemoveItem: _removeItem,
        productsImages: productsImages,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Shop \'n\' Chop',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle_outline_sharp),
            label: 'Checkout',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
