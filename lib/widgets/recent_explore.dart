import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluxstore/constants/images.dart';
import 'package:fluxstore/models/recent_explore.dart';
import 'package:fluxstore/screen_screen.dart';
import 'package:fluxstore/theme/colors.dart';
import 'package:fluxstore/theme/textstyles.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentExplore extends StatelessWidget {
  const RecentExplore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: recentExplore.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(bottom: 13.0),
              child: Container(
                height: Responsive.isTablet(context) ? 130 : 100,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: Responsive.isTablet(context) ? 80 : 60,
                                width: Responsive.isTablet(context) ? 80 : 60,
                                child: Center(
                                  child: SizedBox(
                                    height:
                                        Responsive.isTablet(context) ? 45 : 35,
                                    width:
                                        Responsive.isTablet(context) ? 45 : 35,
                                    child: Image.asset(
                                      recentExplore[index].image ?? '',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.darkBlue.withOpacity(.2),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dessert',
                                    style: ksmallTextStyle(context),
                                  ),
                                  Text(
                                    recentExplore[index].name ?? '',
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: Responsive.isTablet(context)
                                          ? 18
                                          : 15,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.darkBlue,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    height: 27,
                                    width: Responsive.isTablet(context)
                                        ? 180
                                        : 160,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.verified,
                                            color: CupertinoColors.activeGreen,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            'Verified HealthCare',
                                            style: ksmallTextStyle(context),
                                          )
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      // color: AppColors.darkBlue.withOpacity(.2),
                                      //  shape: BoxShape.rectangle,
                                      border: Border.all(
                                        color: AppColors.darkBlue,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: recentExplore[index].price,
                                  style: GoogleFonts.lato(
                                    fontSize:
                                        Responsive.isTablet(context) ? 21 : 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: recentExplore[index].cents,
                                  style: GoogleFonts.lato(
                                    fontSize:
                                        Responsive.isTablet(context) ? 15 : 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.sideMenu.withAlpha(10),
                      offset: Offset(0, 2),
                      blurRadius: 6,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
