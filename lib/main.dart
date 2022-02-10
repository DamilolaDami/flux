import 'package:flutter/material.dart';
import 'package:fluxstore/pages/introduction_screen.dart';
import 'package:fluxstore/providers/cart_provider.dart';
import 'package:fluxstore/providers/favorite_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cartprovider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteeProvider(),
        ),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            canvasColor: Colors.transparent,
            primarySwatch: Colors.blue,
          ),
          home: const OnboardingScreen(),
        );
      }),
    );
  }
}
