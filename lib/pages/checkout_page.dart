import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluxstore/pages/odercomplete.dart';
import 'package:fluxstore/providers/cart_provider.dart';
import 'package:fluxstore/screen_screen.dart';
import 'package:fluxstore/theme/colors.dart';
import 'package:fluxstore/theme/textstyles.dart';
import 'package:fluxstore/widgets/icon_container_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Cartprovider>(context);
    return Scaffold(
      backgroundColor: AppColors.sfBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                    color: AppColors.darkBlue,
                  ),
                  const SizedBox(width: 3),
                  Text('Checkout Page',
                      style: GoogleFonts.aBeeZee(
                          fontSize: Responsive.isTablet(context) ? 19 : 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBlue)),
                ],
              ),
              const DeleiveryBox(),
              const SizedBox(height: 10),
              Text('Available For',
                  style: GoogleFonts.aBeeZee(
                      fontSize: Responsive.isTablet(context) ? 19 : 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue)),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                    itemCount: provider.cartItemsCount,
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
                                              child: Container(
                                                height: 45,
                                                width: 45,
                                                child: Image.asset(
                                                  provider
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
                                                      "20% off",
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
                                              provider.cartItems[index].title,
                                              style: GoogleFonts.aBeeZee(
                                                  fontSize: Responsive.isTablet(
                                                          context)
                                                      ? 18
                                                      : 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.darkBlue),
                                            ),
                                            Text(
                                              '\$${provider.cartItems[index].price.toString()}',
                                              style: TextStyle(
                                                  fontSize: Responsive.isTablet(
                                                          context)
                                                      ? 19
                                                      : 16,
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
                                          return AlertDialog(
                                            title: const Text('Are you sure?'),
                                            content: const Text(
                                                'Do you want to remove this item from the cart?'),
                                            actions: [
                                              FlatButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('No')),
                                              FlatButton(
                                                  onPressed: () {
                                                    provider.removeItem(index);
                                                    Fluttertoast.showToast(
                                                        msg: 'item removed');
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text('Yes'))
                                            ],
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
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const ModalSheet();
                            });
                      },
                      child: Container(
                        height: 65,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Pay \$${provider.totalPrice.toString()}",
                              style: GoogleFonts.aBeeZee(
                                color: AppColors.white,
                                fontSize:
                                    Responsive.isTablet(context) ? 19 : 16,
                              ),
                            ),
                          ],
                        ),
                        decoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(20),
                          color: AppColors.darkBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModalSheet extends StatefulWidget {
  const ModalSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<ModalSheet> createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  List paymentMethods = [
    {
      'name': 'Cash on Delivery',
      'icon': 'assets/images/icons/pngs/cashondelivery.png',
      'selected': true,
    },
    {
      'name': 'Paypal',
      'icon': 'assets/images/icons/pngs/paypal.png',
      'selected': false,
    },
    {
      'name': 'Credit Card',
      'icon': 'assets/images/icons/pngs/credit_card.png',
      'selected': false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 9 / 10,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Payment Method",
                    style: GoogleFonts.aBeeZee(
                        fontSize: Responsive.isTablet(context) ? 21 : 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkBlue)),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ClipRRect(
                          child: SwitchListTile(
                            title: Row(
                              children: [
                                Image.asset(
                                  paymentMethods[index]['icon'],
                                  height: 25,
                                  width: 25,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  paymentMethods[index]['name'],
                                  style: GoogleFonts.aBeeZee(
                                    fontSize:
                                        Responsive.isTablet(context) ? 19 : 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            value: paymentMethods[index]['selected'],
                            onChanged: (value) {
                              setState(() {
                                paymentMethods[index]['selected'] = value;
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: paymentMethods.length),
            ),
            GestureDetector(
              onTap: () {
                pushNewScreen(
                  context,
                  screen: const OrderComplete(),
                  withNavBar: false,
                );
                Provider.of<Cartprovider>(context, listen: false).clearCart();
              },
              child: Container(
                height: 65,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Confirm Order",
                      style: GoogleFonts.aBeeZee(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  color: AppColors.darkBlue,
                ),
              ),
            ),
          ],
        ),
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
    );
  }
}

class DeleiveryBox extends StatelessWidget {
  const DeleiveryBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.isTablet(context) ? 210 : 180,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 28.0, left: 8.0, right: 8.0, bottom: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconContainer(
                      color: Colors.white.withAlpha(70),
                      icon: Icons.location_on,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Home',
                          style: GoogleFonts.aBeeZee(
                              fontSize: Responsive.isTablet(context) ? 15 : 13,
                              color: Colors.white),
                        ),
                        Text(
                          'Agege, Lagos',
                          style: GoogleFonts.aBeeZee(
                              fontSize: Responsive.isTablet(context) ? 19 : 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Text('Edit',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 13, color: Colors.orange[700])),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconContainer(
                      color: Colors.white.withAlpha(70),
                      icon: Icons.timer,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Prepare & Deliver',
                          style: GoogleFonts.aBeeZee(
                              fontSize: Responsive.isTablet(context) ? 15 : 13,
                              color: Colors.white),
                        ),
                        Text(
                          '45 minutes',
                          style: GoogleFonts.aBeeZee(
                              fontSize: Responsive.isTablet(context) ? 19 : 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Text('Choose Time',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 13, color: Colors.orange[700])),
              ],
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
