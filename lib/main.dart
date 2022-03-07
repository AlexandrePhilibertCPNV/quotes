import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:quotes/managers/favorite_quote_manager.dart';

import 'package:quotes/managers/quote_manager.dart';
import 'package:quotes/screens/home.dart';

GetIt getIt = GetIt.instance;

void main() {
  QuoteManager.register();
  FavoriteQuoteManager.register();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
