import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_t4f/core/widgets/loading_screen.dart';

import '../../data/model/ProductEntity.dart';
import '../../data/rep/product_repository.dart';
import '../widgets/productCarousel_screen.dart';

class ProductScreen extends StatefulWidget {
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _getProductList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 150, top: 30, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Choose Your product",
                    style: TextStyle(fontSize: 21, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 15, spreadRadius: 2)],
                        gradient: LinearGradient(colors: [
                          Color(0xff34C8E8),
                          Color(0xff4E4AF2),
                        ])),
                    child: Center(
                      child: Icon(
                        Icons.search,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            products.isEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Center(child: LoadingWidget()),
                  ) // Show loader until products are fetched
                : ProductCarousel(products: products),
          ],
        ), // Use the refactored ProductCarousel widget
      ),
    );
  }

  _getProductList() async {
    products = await productRepository.getAll();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lastClickedProductId = prefs.getString('lastClickedProduct');

    // If the last clicked product ID exists, reorder the products
    if (lastClickedProductId != null) {
      Product? lastClickedProduct = products.firstWhere(
        (product) => product.id == lastClickedProductId,
      );

      if (lastClickedProduct != null) {
        products.remove(lastClickedProduct);
        products.insert(0, lastClickedProduct);
      }
    }

    setState(() {});
  }
}
