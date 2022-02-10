import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluxstore/constants/images.dart';
import 'package:fluxstore/providers/favorite_provider.dart';
import 'package:fluxstore/theme/colors.dart';
import 'package:fluxstore/theme/textstyles.dart';
import 'package:fluxstore/widgets/titletext.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    var favouriteProvider = Provider.of<FavoriteeProvider>(context);
    return Scaffold(
        backgroundColor: AppColors.sfBgColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Favourites',
                        style: GoogleFonts.aBeeZee(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      PopupMenuButton(
                        itemBuilder: (BuildContext context) {
                          return {'Clear All', 'Sort By'}.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),
                    ],
                  ),
                  favouriteProvider.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(top: 150.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                cartempty,
                                color: Colors.black,
                                height: 200,
                                width: 200,
                              ),
                              Center(
                                  child: Text(
                                'No Items in Favourites, Check out some items',
                                style: GoogleFonts.aBeeZee(
                                  color: Colors.black,
                                ),
                              )),
                            ],
                          ),
                        )
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                        color: AppColors
                                                            .lightBlue
                                                            .withOpacity(.3)),
                                                    child: Container(
                                                      height: 45,
                                                      width: 45,
                                                      child: Image.asset(
                                                        favouriteProvider
                                                            .favorite[index]
                                                            .image,
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
                                                            style: GoogleFonts
                                                                .aBeeZee(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ),
                                                        decoration: BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                    style: ksmallTextStyle(
                                                        context),
                                                  ),
                                                  const SizedBox(height: 2),
                                                  Text(
                                                    favouriteProvider
                                                        .favorite[index].title,
                                                    style: GoogleFonts.aBeeZee(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            AppColors.darkBlue),
                                                  ),
                                                  Text(
                                                    '\$${favouriteProvider.favorite[index].price.toString()}',
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
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
                                          Icons.remove_circle,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Are you sure?'),
                                                  content: const Text(
                                                      'Do you want to remove this item from favorites?'),
                                                  actions: [
                                                    FlatButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child:
                                                            const Text('No')),
                                                    FlatButton(
                                                        onPressed: () {
                                                          favouriteProvider
                                                              .removeFavorite(
                                                                  index);
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  'item removed');
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child:
                                                            const Text('Yes'))
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
                          },
                          itemCount: favouriteProvider.count,
                        ),
                ],
              ),
            ),
          ),
        ));
  }
}
