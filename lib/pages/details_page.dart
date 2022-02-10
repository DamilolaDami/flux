import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluxstore/constants/images.dart';
import 'package:fluxstore/models/card_items.dart';
import 'package:fluxstore/pages/cart.dart';
import 'package:fluxstore/providers/cart_provider.dart';
import 'package:fluxstore/providers/favorite_provider.dart';
import 'package:fluxstore/screen_screen.dart';
import 'package:fluxstore/theme/colors.dart';
import 'package:fluxstore/theme/textstyles.dart';
import 'package:fluxstore/widgets/icon_container_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final CardItems cardData;
  const DetailsPage({Key? key, required this.cardData}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var counter = 0;
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<Cartprovider>(context);
    var favouriteProvider = Provider.of<FavoriteeProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.sfBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                //   child: Image.asset(widget.cardData.image),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: AppColors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (favouriteProvider
                                  .isFavorite(widget.cardData)) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content:
                                      const Text("Already added to favourite"),
                                  action: SnackBarAction(
                                    label: "Undo",
                                    textColor: AppColors.white,
                                    onPressed: () {
                                      favouriteProvider
                                          .removeFavoritefromSnakbar(
                                              widget.cardData);
                                    },
                                  ),
                                  backgroundColor: Colors.red,
                                ));
                              } else {
                                favouriteProvider.addFavorite(widget.cardData);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Added to favourite"),
                                  backgroundColor: Colors.green,
                                ));
                              }
                            },
                            child: Icon(
                              favouriteProvider.isFavorite(widget.cardData)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color:
                                  favouriteProvider.isFavorite(widget.cardData)
                                      ? Colors.red
                                      : AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (cartProvider.isincart(widget.cardData)) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text("Item already added to cart"),
                              duration: const Duration(milliseconds: 20),
                              action: SnackBarAction(
                                label: "Undo",
                                textColor: AppColors.white,
                                onPressed: () {
                                  cartProvider.removeItemwithId(
                                    CardItems(
                                      title: widget.cardData.title,
                                      image: widget.cardData.image,
                                      ingredients: widget.cardData.ingredients,
                                      price: widget.cardData.price,
                                      id: widget.cardData.id,
                                      count: 1,
                                    ),
                                  );
                                },
                              ),
                              backgroundColor: Colors.red,
                            ));
                          } else {
                            cartProvider.addToCart(
                              CardItems(
                                title: widget.cardData.title,
                                image: widget.cardData.image,
                                ingredients: widget.cardData.ingredients,
                                price: widget.cardData.price,
                                id: widget.cardData.id,
                                discount: widget.cardData.discount,
                                count: 1,
                              ),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Item added to cart"),
                              duration: Duration(milliseconds: 20),
                              backgroundColor: Colors.green,
                            ));
                          }
                        },
                        child: Container(
                            height: Responsive.isTablet(context) ? 45 : 25,
                            width: Responsive.isTablet(context) ? 85 : 75,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Add to cart',
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkBlue,
                                ),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '\$ ${widget.cardData.price.toString()}',
                              style: GoogleFonts.lato(
                                fontSize:
                                    Responsive.isTablet(context) ? 40 : 25,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: widget.cardData.cents,
                              style: GoogleFonts.lato(
                                fontSize:
                                    Responsive.isTablet(context) ? 17 : 13,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: Responsive.isTablet(context) ? 22 : 16,
                                )),
                      )
                    ],
                  ),
                ),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                color: AppColors.darkBlue,
              ),
              Positioned(
                  top: Responsive.isTablet(context)
                      ? MediaQuery.of(context).size.height / 4.5
                      : 130,
                  left: Responsive.isTablet(context)
                      ? MediaQuery.of(context).size.width / 1.5
                      : 200,
                  child: SizedBox(
                      height: Responsive.isTablet(context) ? 240 : 170,
                      width: Responsive.isTablet(context) ? 280 : 170,
                      child: Hero(
                          tag: widget.cardData.title,
                          child: Image.asset(widget.cardData.image)))),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 28.0, left: 10, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Health Food',
                                style: ksmallTextStyle(context),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(Icons.verified_user,
                                  color: CupertinoColors.systemGreen)
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.cardData.title,
                            style: klargeTextStyle(context),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.cardData.about ?? '',
                            style: ksmallTextStyle(context),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('Read More...',
                              style: GoogleFonts.aBeeZee(
                                fontSize: 13.0,
                                color: AppColors.darkBlue,
                              )),
                          const SizedBox(
                            height: 45,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Ingredients',
                                    style: klargeTextStyle(context)),
                                const SizedBox(
                                  height: 15,
                                ),
                                const SizedBox(
                                  height: 50,
                                  child: IngredientWidget(),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 55,
                          ),
                          OrderButton(
                            cardData: widget.cardData,
                            cartProvider: cartProvider,
                          )
                        ],
                      ),
                    ),
                    height: Responsive.isTablet(context) ? 650 : 450,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }
}

class OrderButton extends StatelessWidget {
  final CardItems cardData;
  final Cartprovider cartProvider;
  const OrderButton({
    Key? key,
    required this.cartProvider,
    required this.cardData,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    //  var cartProvider = Provider.of<Cartprovider>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 65,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Order Now",
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
                // borderRadius: BorderRadius.circular(20),
                color: AppColors.darkBlue,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              pushNewScreen(context, screen: Cart(), withNavBar: false);
            },
            child: Container(
              height: 65,
              width: 65,
              child: const Center(
                child: Icon(
                  Icons.shopping_cart,
                  color: AppColors.darkBlue,
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.darkBlue,
                  width: 2,
                ),
                color: AppColors.white,
                //borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IngredientWidget extends StatelessWidget {
  const IngredientWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Ingredients(
          ingredient: pepper,
        ),
        SizedBox(
          width: 10,
        ),
        Ingredients(ingredient: beans),
        SizedBox(
          width: 10,
        ),
        Ingredients(ingredient: orange),
        SizedBox(
          width: 10,
        ),
        Ingredients(
          ingredient: pepper,
        ),
        SizedBox(
          width: 10,
        ),
        Ingredients(ingredient: beans),
        SizedBox(
          width: 10,
        ),
        Ingredients(ingredient: orange, isLast: true)
      ],
    );
  }
}

class Ingredients extends StatelessWidget {
  final bool isLast;
  final String ingredient;
  const Ingredients({Key? key, this.isLast = false, required this.ingredient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLast
        ? Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                height: Responsive.isTablet(context) ? 80 : 50,
                width: Responsive.isTablet(context) ? 80 : 50,
                child: Image.asset(ingredient),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue.withOpacity(.1),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Positioned(
                child: Container(
                    height: 25,
                    width: 25,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.darkBlue,
                    ),
                    child: Center(
                        child: Text(
                      '+6',
                      style: GoogleFonts.aBeeZee(
                        color: AppColors.white,
                        fontSize: 12,
                      ),
                    ))),
                right: -5,
                top: -6,
              ),
            ],
          )
        : Container(
            height: Responsive.isTablet(context) ? 80 : 50,
            width: Responsive.isTablet(context) ? 80 : 50,
            child: Image.asset(ingredient),
            decoration: BoxDecoration(
              color: AppColors.lightBlue.withOpacity(.1),
              borderRadius: BorderRadius.circular(15),
            ),
          );
  }
}
