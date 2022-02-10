import 'package:flutter/material.dart';
import 'package:fluxstore/models/introduction_contents.dart';
import 'package:fluxstore/pages/main_page.dart';
import 'package:fluxstore/screen_screen.dart';
import 'package:fluxstore/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  late PageController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  Widget build(BuildContext context) {
    // SizeConfigs().init(context);
    return Scaffold(
      backgroundColor: AppColors.sfBgColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: stuffs.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.only(top: 65, left: 20, right: 20),
                  child: Column(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width,
                          child: Lottie.asset(stuffs[i].img)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        stuffs[i].title,
                        style: GoogleFonts.aBeeZee(
                            fontSize: Responsive.isTablet(context) ? 35 : 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        stuffs[i].description,
                        style: GoogleFonts.oswald(
                          fontSize: Responsive.isTablet(context) ? 20 : 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                stuffs.length, (index) => buildDots(index, context)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
            child: ButtonTheme(
              height: Responsive.isTablet(context) ? 80 : 50,
              child: TextButton(
                onPressed: () {
                  if (currentIndex == stuffs.length - 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()));
                  }
                  _controller.nextPage(
                    duration: const Duration(microseconds: 100),
                    curve: Curves.elasticInOut,
                  );
                },
                child: Center(
                    child: Text(
                  currentIndex == stuffs.length - 1 ? "Get Started" : 'Next',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            decoration: BoxDecoration(
                color: AppColors.darkBlue,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.darkBlue.withOpacity(0.5),
                      offset: const Offset(1, -2),
                      blurRadius: 9),
                  BoxShadow(
                      color: AppColors.darkBlue.withOpacity(0.5),
                      offset: const Offset(-1, 2),
                      blurRadius: 9)
                ]),
          ),
        ],
      ),
    );
  }

  Container buildDots(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index ? AppColors.darkBlue : Colors.grey),
    );
  }
}
