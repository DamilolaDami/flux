import 'package:flutter/material.dart';
import 'package:fluxstore/screen_screen.dart';
import 'package:fluxstore/theme/colors.dart';
import 'package:fluxstore/theme/textstyles.dart';
import 'package:fluxstore/widgets/app_bar.dart';
import 'package:fluxstore/widgets/for_you.dart';
import 'package:fluxstore/widgets/recent_explore.dart';
import 'package:fluxstore/widgets/search_bar_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColors.sfBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarWidget(),
                const SizedBox(height: 16),
                const SearchBar(),
                const SizedBox(height: 20),
                const ReccommendMenu(),
                const SizedBox(height: 16),
                SizedBox(
                    height: Responsive.isTablet(context) ? 340 : 270,
                    child: const ForYou()),
                const RecentExploreText(),
                const SizedBox(height: 16),
                const RecentExplore(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecentExploreText extends StatelessWidget {
  const RecentExploreText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Recent Explore",
            style: GoogleFonts.aBeeZee(
                color: AppColors.darkBlue,
                fontSize: Responsive.isTablet(context) ? 21 : 16,
                fontWeight: FontWeight.w600)),
        Text("View All", style: ksmallTextStyle(context)),
      ],
    );
  }
}

class ReccommendMenu extends StatelessWidget {
  const ReccommendMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Reccomended Menu",
        style: GoogleFonts.aBeeZee(
            color: AppColors.darkBlue,
            fontSize: Responsive.isTablet(context) ? 21 : 16,
            fontWeight: FontWeight.w600));
  }
}
