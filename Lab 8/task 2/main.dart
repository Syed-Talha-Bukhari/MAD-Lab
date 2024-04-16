import 'package:flutter/material.dart';
import 'package:assignment_1/views/cart_screen.dart';
import 'package:assignment_1/views/catalog_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 8 Task 2 Talha (335474)',
      theme: ThemeData(
        // primarySwatch: Colors.yellow,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CatalogScreen(),
        '/cart': (context) => const CartScreen(),
      },
    );
  }
}
