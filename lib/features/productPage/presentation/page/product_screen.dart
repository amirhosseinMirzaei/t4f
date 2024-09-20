import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(

      appBar: AppBar(),
      body:
      products.isEmpty
          ? Center(child: CircularProgressIndicator()) // Show loader until products are fetched
          : ProductCarousel(products: products), // Use the refactored ProductCarousel widget
    );
  }

  _getProductList() async {
    products = await productRepository.getAll();
    print(products);
    setState(() {});
  }
}
