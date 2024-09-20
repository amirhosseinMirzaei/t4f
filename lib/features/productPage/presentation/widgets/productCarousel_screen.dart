import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_t4f/core/widgets/loading_screen.dart';
import 'package:test_t4f/features/productPage/presentation/widgets/productDetail_screen.dart';

import '../../data/model/ProductEntity.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;

  const ProductCarousel({required this.products, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: products.length,
      itemBuilder: (context, index, realIndex) {
        return ProductCard(product: products[index]);
      },
      options: CarouselOptions(
        height: 400,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 10,
        viewportFraction: 0.6,
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color;
    return InkWell(
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('lastClickedProduct', product.id!);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetail(product);
        }));
      },
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: theme.cardColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              product.image != null
                  ? Stack(
                      clipBehavior: Clip.none, // Allow children to overflow outside the Stack
                      children: [
                        // Only Clip the image, not the entire Stack
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20), // Apply radius to the image
                          child: Image.network(
                            product.image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(top: 15, left: 10, child: SvgPicture.asset('assets/icons/heart.svg')),
                        Positioned(
                          bottom: -13, // Move the container below the image
                          left: 12,
                          child: Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15), // Keep the radius for the container
                              gradient: LinearGradient(colors: [
                                Color(0xff4E4AF2),
                                Color(0xff34C8E8),
                              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 2), // Add shadow for better effect
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "\$${double.parse(product.price!).toStringAsFixed(2)}", // Format price
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Ensure text is visible on the gradient
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Placeholder(fallbackHeight: 150, fallbackWidth: double.infinity),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  product.title ?? "",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 19),
                child: Text("city: ${product.city.toString()}"),
              ),
              Divider(),
              Expanded(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        spreadRadius: -9,
                        blurRadius: 20,
                      ),
                    ], borderRadius: BorderRadius.circular(13), color: theme.cardColor),
                    child: Center(
                      child: Text(
                        "for more detail click",
                        style: TextStyle(fontSize: 13, color: Color(0xff3C9EEA)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
