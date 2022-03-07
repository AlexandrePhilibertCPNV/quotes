import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:quotes/managers/favorite_quote_manager.dart';
import 'package:quotes/managers/quote_manager.dart';
import 'package:quotes/models/quote.dart';
import 'package:quotes/screens/favorites.dart';

class HomeScreen extends StatelessWidget with GetItMixin {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AsyncSnapshot<Quote> quoteSnapshot =
        watchStream((QuoteManager m) => m.stream, Quote.none());

    final Quote quote = quoteSnapshot.data!;
    final FavoriteQuoteManager favoriteQuoteManager =
        watch(target: FavoriteQuoteManager.instance);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quote"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.favorite,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              quoteSnapshot.hasData
                  ? Column(
                      children: <Widget>[
                        Text(
                          quote.body,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          quote.author,
                        ),
                        IconButton(
                          onPressed: () {
                            String snackBarText;

                            if (favoriteQuoteManager.contains(quote)) {
                              favoriteQuoteManager.remove(quoteSnapshot.data!);
                              snackBarText = "Removed from favorites";
                            } else {
                              favoriteQuoteManager.add(quoteSnapshot.data!);
                              snackBarText = "Added to favorites";
                            }

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(snackBarText),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: favoriteQuoteManager.contains(quote)
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      ],
                    )
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
