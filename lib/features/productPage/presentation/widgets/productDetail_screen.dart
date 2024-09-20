import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_t4f/features/productPage/data/model/ProductEntity.dart';

class ProductDetail extends StatelessWidget {
  Product product;
  bool isSelectedDes = true;
  bool isSelectedSpec = false;

  ProductDetail(this.product);

  @override
  Widget build(BuildContext context) {
    double imageHeight = 400.0;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.network(
                    product.image!,
                    width: double.infinity, // Full width image
                    height: imageHeight, // Fixed height of the image
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 15, spreadRadius: 2)],
                            gradient: LinearGradient(colors: [
                              Color(0xff34C8E8),
                              Color(0xff4E4AF2),
                            ])),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: imageHeight - 40,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height - imageHeight, // Remaining height after the image
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.6)),
                        gradient: LinearGradient(colors: [Color(0xff353F54), Color(0xff222834)]),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50, top: 27, right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 150,
                                  height: 50,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.1),
                                      spreadRadius: -9,
                                      blurRadius: 20,
                                      offset: Offset(0, -5),
                                    ),
                                  ], borderRadius: BorderRadius.circular(13), color: Color(0xff323B4F)),
                                  child: Center(
                                    child: Text(
                                      "Description",
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.w700, color: isSelectedDes ? Color(0xff4286EE) : Colors.grey),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 50,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.1),
                                      spreadRadius: -9,
                                      blurRadius: 20,
                                      offset: Offset(2, 5),
                                    ),
                                  ], borderRadius: BorderRadius.circular(13), color: Color(0xff323B4F)),
                                  child: Center(
                                    child: Text(
                                      product.type!,
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.w400, color: isSelectedSpec ? Color(0xff28303F) : Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Text(
                              product.title.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 12, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      CupertinoIcons.person,
                                      size: 22,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      product.presenter ?? "",
                                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${product.rate} available",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -13,
                    child: Container(
                      height: 80,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(53), topRight: Radius.circular(53)),
                        color: Color(0xff262E3D),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 60, right: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$${double.parse(product.price!).toStringAsFixed(2)}", // Format price
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff3D9CEA), // Ensure text is visible on the gradient
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff1fb7dc), width: 2),
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(colors: [
                                    Color(0xff34C8E8),
                                    Color(0xff4E4AF2),
                                  ])),
                              child: Center(
                                child: Text(
                                  "Add to Cart",
                                  style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
