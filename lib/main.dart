import 'package:SummaryDo/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Rekap());

class Rekap extends StatelessWidget {
  const Rekap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Summary Do',
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
