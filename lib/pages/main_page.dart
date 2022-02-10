import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxstore/pages/cart.dart';
import 'package:fluxstore/pages/category_page.dart';
import 'package:fluxstore/pages/favourites.dart';
import 'package:fluxstore/pages/homepage.dart';
import 'package:fluxstore/pages/profile.dart';
import 'package:fluxstore/pages/searchpage.dart';
import 'package:fluxstore/providers/cart_provider.dart';
import 'package:fluxstore/screen_screen.dart';
import 'package:fluxstore/theme/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var cartlist = Provider.of<Cartprovider>(context);
    List<Widget> _buildScreens = [
      const HomePage(),
      const SearchPage(),
      const Caterogies(),
      const Favourites(),
      const Profile(),
    ];
    List<PersistentBottomNavBarItem> navbarItems = [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        activeColorPrimary: AppColors.darkBlue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.search),
        activeColorPrimary: AppColors.darkBlue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.list),
        activeColorPrimary: AppColors.darkBlue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.favorite),
          activeColorPrimary: AppColors.darkBlue,
          inactiveColorPrimary: Colors.grey),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings_solid),
        activeColorPrimary: AppColors.darkBlue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
    return PersistentTabView(
      context,
      // controller: _controller,
      screens: _buildScreens,
      items: navbarItems,

      confineInSafeArea: true,

      backgroundColor: Colors.white,

      handleAndroidBackButtonPress: true,

      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,

      decoration: const NavBarDecoration(
          colorBehindNavBar: AppColors.darkBlue,
          boxShadow: [
            BoxShadow(
              color: AppColors.darkBlue,
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ]),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style8,
      floatingActionButton: Responsive.isTablet(context)
          ? Stack(
              overflow: Overflow.visible,
              children: [
                FloatingActionButton.extended(
                  label: Row(
                    children: const [
                      Icon(Icons.shopping_cart),
                      SizedBox(width: 5),
                      Text(
                        'Cart',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  isExtended: Responsive.isTablet(context),
                  onPressed: () {
                    pushNewScreen(
                      context,
                      screen: Cart(),
                      withNavBar: false,
                    );
                  },
                  backgroundColor: AppColors.darkBlue,
                ),
                Positioned(
                  top: Responsive.isTablet(context) ? -8 : 0,
                  right: 0,
                  child: Container(
                    width: Responsive.isTablet(context) ? 25 : 20,
                    height: Responsive.isTablet(context) ? 25 : 20,
                    decoration: BoxDecoration(
                      color: CupertinoColors.activeGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        cartlist.cartItems.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Stack(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    pushNewScreen(
                      context,
                      screen: Cart(),
                      withNavBar: false,
                    );
                  },
                  backgroundColor: AppColors.darkBlue,
                  child: const Icon(Icons.shopping_cart),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: CupertinoColors.activeGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        cartlist.cartItems.length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
