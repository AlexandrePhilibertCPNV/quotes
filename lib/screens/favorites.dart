import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:quotes/managers/favorite_quote_manager.dart';

class FavoritesScreen extends StatelessWidget with GetItMixin {
  FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteQuoteManager favoritesQuotesManager = get<FavoriteQuoteManager>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Center(
        child: favoritesQuotesManager.quotes.isEmpty
            ? const Text('No quotes in favorites')
            : ListView.builder(
                itemCount: favoritesQuotesManager.quotes.length,
                itemBuilder: (BuildContext context, int index) {
                  var quote = favoritesQuotesManager.quotes[index];

                  return Dismissible(
                    key: Key(quote.id),
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      child: ListTile(
                        title: Text(quote.body),
                        subtitle: Text(quote.author),
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      child: const Icon(
                        Icons.delete_forever,
                        color: Colors.white,
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    onDismissed: (direction) {
                      favoritesQuotesManager.remove(quote);
                    },
                  );
                },
              ),
      ),
    );
  }
}
