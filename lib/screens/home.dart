import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:quotes/managers/quote_manager.dart';
import 'package:quotes/models/quote.dart';

class HomeScreen extends StatelessWidget with GetItMixin {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AsyncSnapshot<Quote> quote =
        watchStream((QuoteManager m) => m.stream, Quote.none());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quote"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              quote.hasData
                  ? Text(quote.data!.body)
                  : const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: QuoteManager.instance.next,
        tooltip: 'New Quote',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
