import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/themes/theme.dart';
import '/src/config/route.dart';
import './src/pages/main_page.dart';
import '/src/pages/product_detail.dart';
import './src/widgets/custom_route.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App (Talha Bukhari (335474))',
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: Routes.getRoute(),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name!.contains('detail')) {
          return CustomRoute<bool>(
              builder: (BuildContext context) => const ProductDetailPage());
        } else {
          return CustomRoute<bool>(
              builder: (BuildContext context) => const MainPage());
        }
      },
      initialRoute: "MainPage",
    );
  }
}
