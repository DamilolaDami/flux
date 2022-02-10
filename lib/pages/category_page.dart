import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluxstore/constants/images.dart';
import 'package:fluxstore/models/categories_list.dart';

import 'package:fluxstore/theme/colors.dart';
import 'package:fluxstore/theme/textstyles.dart';
import 'package:google_fonts/google_fonts.dart';

class Caterogies extends StatefulWidget {
  const Caterogies({Key? key}) : super(key: key);

  @override
  _CaterogiesState createState() => _CaterogiesState();
}

class _CaterogiesState extends State<Caterogies> {
  List allCategories = [
    pepper,
    orange,
    beans,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.sfBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Caterogies',
                    style: klargeTextStyle(context),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined))
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: MasonryGridView.count(
                itemCount: categories.length,
                crossAxisCount: 2,
                mainAxisSpacing: 9,
                crossAxisSpacing: 9,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                          child: categories[index].isAll == true
                              ? Row(
                                  children: allCategories
                                      .map<Widget>((e) => Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(e),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                )
                              : Image.asset(
                                  categories[index].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 25,
                          width: double.infinity,
                          color: AppColors.darkBlue,
                          child: Center(
                            child: Text(
                              categories[index].title,
                              style: GoogleFonts.aBeeZee(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    height: 160,
                    width: 80,
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
