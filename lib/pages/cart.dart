// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluxstore/constants/images.dart';
import 'package:fluxstore/pages/checkout_page.dart';
import 'package:fluxstore/providers/cart_provider.dart';
import 'package:fluxstore/screen_screen.dart';
import 'package:fluxstore/theme/colors.dart';
import 'package:fluxstore/theme/textstyles.dart';
import 'package:fluxstore/widgets/alertbox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var carItems = Provider.of<Cartprovider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              color: AppColors.white,
            ),
            tooltip: 'Options',
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'Clear Cart', 'Sort By'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      backgroundColor: AppColors.sfBgColor,
      body: Column(
        children: [
          Expanded(
            child: carItems.cartItems.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        cartempty,
                        color: Colors.black,
                        height: Responsive.isTablet(context) ? 280 : 200,
                        width: Responsive.isTablet(context) ? 280 : 200,
                      ),
                      Center(
                          child: Text(
                        'No Items in Cart, Continue Shopping',
                        style: GoogleFonts.aBeeZee(
                          color: Colors.black,
                          fontSize: Responsive.isTablet(context) ? 23 : 15,
                        ),
                      )),
                    ],
                  )
                : ListView.builder(
                    itemCount: carItems.cartItemsCount,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: 4.0, left: 8, right: 8, top: 12),
                        child: Container(
                          height: 132,
                          child: Stack(
                            overflow: Overflow.visible,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Stack(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors.lightBlue
                                                      .withOpacity(.3)),
                                              child: SizedBox(
                                                height: 45,
                                                width: 45,
                                                child: Image.asset(
                                                  carItems
                                                      .cartItems[index].image,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                top: 0,
                                                right: 0,
                                                child: Container(
                                                  height: 20,
                                                  width: 60,
                                                  child: Center(
                                                    child: Text(
                                                      "${carItems.cartItems[index].discount.toStringAsFixed(0)}% off",
                                                      style:
                                                          GoogleFonts.aBeeZee(
                                                        color: AppColors.white,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  decoration: BoxDecoration(
                                                      color: Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                ))
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Healthy Food",
                                              style: ksmallTextStyle(context),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              carItems.cartItems[index].title,
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: Responsive.isTablet(
                                                          context)
                                                      ? 18
                                                      : 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.darkBlue),
                                            ),
                                            Text(
                                              '\$${carItems.cartItems[index].price.toString()}',
                                              style: TextStyle(
                                                  fontSize: Responsive.isTablet(
                                                          context)
                                                      ? 18
                                                      : 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            // Text(carItems.cardItems[index].count
                                            //     .toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertBox(
                                            carItems: carItems,
                                            content:
                                                'Are you sure you want to remove this item from cart?',
                                            onPressed: () {
                                              carItems.removeItem(index);
                                              Fluttertoast.showToast(
                                                  msg: 'item removed');
                                              Navigator.of(context).pop();
                                            },
                                            index: index,
                                          );
                                        });
                                  },
                                ),
                                // Text(
                                //   carItems.cartItems[index].quantity.toString(),
                                //   style: TextStyle(
                                //       fontSize: 20, fontWeight: FontWeight.bold),
                                // ),
                              )
                            ],
                          ),
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                      );
                    }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 125,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: GoogleFonts.aBeeZee(
                            fontSize: Responsive.isTablet(context) ? 18 : 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),

                      Text(
                        '\$${carItems.discount.toStringAsFixed(0)}',
                        style: GoogleFonts.aBeeZee(
                            fontSize: Responsive.isTablet(context) ? 18 : 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      // Text(
                      //   carItems.totalPrice.toString(),
                      //   style: klargeTextStyle,
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: GoogleFonts.aBeeZee(
                            fontSize: Responsive.isTablet(context) ? 18 : 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),

                      Text(
                        '\$${carItems.totalPrice.toString()}',
                        style: GoogleFonts.aBeeZee(
                            fontSize: Responsive.isTablet(context) ? 20 : 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkBlue),
                      ),
                      // Text(
                      //   carItems.totalPrice.toString(),
                      //   style: klargeTextStyle,
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (carItems.cartItems.isEmpty) {
                        Fluttertoast.showToast(msg: 'Cart is Empty');
                      } else {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => Checkout(
                        //           carItems: carItems,
                        //         )));
                      }
                    },
                    child: GestureDetector(
                      onTap: () {
                        if (carItems.cartItems.isEmpty) {
                          Fluttertoast.showToast(msg: 'Cart is Empty');
                        } else {
                          pushNewScreen(
                            context,
                            screen: const Checkout(),
                            withNavBar: false,
                          );
                        }
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Proceed to Checkout",
                              style: GoogleFonts.aBeeZee(
                                color: AppColors.white,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.white,
                              size: 15,
                            )
                          ],
                        ),
                        decoration: const BoxDecoration(
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleClick(String value) {
    var cartItems = Provider.of<Cartprovider>(context, listen: false);
    switch (value) {
      case 'Clear Cart':
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('Do you want to clear the cart?'),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('No')),
                  FlatButton(
                      onPressed: () {
                        Provider.of<Cartprovider>(context, listen: false)
                            .clearCart();
                        Fluttertoast.showToast(
                            msg: cartItems.cartItems.isEmpty
                                ? 'Cart is ALready Empty'
                                : 'Cart Cleared');
                        Navigator.of(context).pop();
                      },
                      child: const Text('Yes'))
                ],
              );
            });

        break;
      case 'Sort By':
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Sort By',
                        style: GoogleFonts.aBeeZee(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkBlue),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Provider.of<Cartprovider>(context,
                                          listen: false)
                                      .sortListbyname();
                                  Navigator.of(context).pop();
                                },
                                child: SizedBox(
                                    height: 50,
                                    width: 100,
                                    child: Center(
                                        child: Text('Name',
                                            style: GoogleFonts.aBeeZee(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            )))))
                          ]),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SizedBox(
                              height: 50,
                              width: 100,
                              child: Center(
                                  child: Text('Price',
                                      style: GoogleFonts.aBeeZee(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      )))))
                    ])),
              );
            });
        break;
    }
  }
}
