import 'package:flutter/material.dart';
import 'package:fluxstore/pages/homepage.dart';
import 'package:fluxstore/pages/main_page.dart';
import 'package:fluxstore/screen_screen.dart';
import 'package:fluxstore/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class OrderComplete extends StatelessWidget {
  const OrderComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Expanded(
                child: Column(
              children: [
                SizedBox(
                    height: 200,
                    width: 200,
                    child:
                        Lottie.asset('assets/images/icons/pngs/complete.json')),
                Text(
                  'Order Complete',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Responsive.isTablet(context) ? 25 : 20,
                  ),
                ),
              ],
            )),
            GestureDetector(
              onTap: () {
                pushNewScreen(
                  context,
                  screen: const MainPage(),
                  withNavBar: true,
                );
              },
              child: Container(
                height: 65,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Back to Homepage",
                      style: GoogleFonts.aBeeZee(
                        color: AppColors.darkBlue,
                        fontSize: Responsive.isTablet(context) ? 25 : 20,
                      ),
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
