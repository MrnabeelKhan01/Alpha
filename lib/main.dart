
import 'package:flutter/material.dart';
import 'presentation/view/drawer/drawer_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:Color(0xffF2F4F7),
        fontFamily:"Nunito",
        useMaterial3: true,
        appBarTheme:AppBarTheme(backgroundColor:Color(0xffF2F4F7),elevation:0,)
      ),
     home:DrawerView(),
    );
  }
}
