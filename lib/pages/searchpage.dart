import 'package:flutter/material.dart';
import 'package:fluxstore/models/recently_viewd.dart';
import 'package:fluxstore/theme/colors.dart';
import 'package:fluxstore/widgets/search_bar_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List categories = [
    'Chicken',
    'Pizza',
    'Burger',
    'Pasta',
    'Noodles',
    'Sandwich',
    'Salad',
    'Dessert',
    'Drinks',
    'Cake',
    'Soup',
    'Juice',
    'Fries',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sfBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const SearchBar(),
                const SizedBox(
                  height: 10,
                ),
                Text('Recently viewed',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 16,
                      color: Colors.grey[600],
                    )),
                const SizedBox(
                  height: 10,
                ),
                const RecentlyViewed(),
                const SizedBox(
                  height: 10,
                ),
                Text('Explore by category',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 16,
                      color: Colors.grey[600],
                    )),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        categories[index],
                        style: GoogleFonts.aBeeZee(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: AppColors.darkBlue,
                      ),
                    );
                  },
                  itemCount: categories.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecentlyViewed extends StatelessWidget {
  const RecentlyViewed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: recentlyViewedList.length,
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              height: 70,
                              width: 70,
                              child:
                                  Image.asset(recentlyViewedList[index].image)),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                recentlyViewedList[index].category,
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(height: 7),
                              Text(
                                recentlyViewedList[index].name,
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$${recentlyViewedList[index].price}',
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Wrap(
                                children: List.generate(
                                    4,
                                    (index) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 14,
                                        )),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.grey[600],
                          ),
                          Container(
                            height: 28,
                            width: 90,
                            color: AppColors.darkBlue,
                            child: Center(
                              child: Text(
                                'Add to cart',
                                style: GoogleFonts.aBeeZee(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                height: 100,
                width: double.infinity,
                color: AppColors.white,
              ),
            ));
  }
}
