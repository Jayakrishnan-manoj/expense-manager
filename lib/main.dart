import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            //backgroundColor: Colors.orange,
            elevation: 20.0,
            titleTextStyle: TextStyle(
              fontSize: 18 ,
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
        ),
        primarySwatch: Colors.orange,
        fontFamily: 'OpenSans',
      ),
      home: HomeScreen(),
    );
  }
}
