import 'package:flutter/material.dart';

import 'package:fluxstore/pages/details_page.dart';
import 'package:fluxstore/providers/cart_provider.dart';
import 'package:fluxstore/providers/favorite_provider.dart';
import 'package:fluxstore/screen_screen.dart';
import 'package:fluxstore/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class ForYou extends StatelessWidget {
  const ForYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favouriteProvider = Provider.of<FavoriteeProvider>(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cardItems.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                pushNewScreen(context,
                    withNavBar: false,
                    screen: DetailsPage(cardData: cardItems[index]));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      height: Responsive.isTablet(context) ? 300 : 250,
                      width: Responsive.isTablet(context) ? 240 : 169,
                      decoration: BoxDecoration(
                        color: index.isEven
                            ? AppColors.fbBlue
                            : AppColors.darkBlue,
                        borderRadius: BorderRadius.circular(10),
                        // image: DecorationImage(
                        //   image: AssetImage(cardItems[index].image),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                    Positioned(
                        top: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cardItems[index].title,
                                style: GoogleFonts.aBeeZee(
                                  fontSize:
                                      Responsive.isTablet(context) ? 18 : 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                cardItems[index].description ?? '',
                                style: GoogleFonts.lato(
                                  fontSize:
                                      Responsive.isTablet(context) ? 14 : 12,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                  children: List.generate(
                                      cardItems.length,
                                      (index) => Icon(
                                            Icons.star,
                                            size: Responsive.isTablet(context)
                                                ? 19
                                                : 15,
                                            color: Colors.orange[600],
                                          )))
                            ],
                          ),
                        )),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: GestureDetector(
                        onTap: () {
                          if (favouriteProvider.isFavorite(cardItems[index])) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text("Already added to favourite"),
                              action: SnackBarAction(
                                label: "Undo",
                                textColor: AppColors.white,
                                onPressed: () {
                                  favouriteProvider.removeFavoritefromSnakbar(
                                      cardItems[index]);
                                },
                              ),
                              backgroundColor: Colors.red,
                            ));
                          } else {
                            favouriteProvider.addFavorite(cardItems[index]);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Added to favourite"),
                              backgroundColor: Colors.green,
                            ));
                          }
                        },
                        child: Icon(
                          favouriteProvider.isFavorite(cardItems[index])
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favouriteProvider.isFavorite(cardItems[index])
                              ? Colors.red
                              : AppColors.white,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 30,
                        left: 10,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '\$ ${cardItems[index].price.toString()}',
                                style: GoogleFonts.lato(
                                  fontSize:
                                      Responsive.isTablet(context) ? 21 : 18,
                                  color: Colors.white,
                                ),
                              ),
                              TextSpan(
                                text: cardItems[index].cents,
                                style: GoogleFonts.lato(
                                  fontSize:
                                      Responsive.isTablet(context) ? 15 : 13,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                        bottom: -35,
                        right: -45,
                        child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Hero(
                                tag: cardItems[index].title,
                                child: Image.asset(cardItems[index].image)))),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
