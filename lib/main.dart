import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utils/rotes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main(List<String> args) {
  runApp(VxState(store: Mystore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: homepage(),
      themeMode: ThemeMode.system,
      theme: Mythemes.lightTheme,
      darkTheme: Mythemes.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homepage,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homepage: (context) => HomePage(),
        MyRoutes.loginpage: (context) => LoginPage(),
        MyRoutes.cartpage: (context) => Cartpage()
      },
    );
  }
}
