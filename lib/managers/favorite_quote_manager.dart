import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:quotes/models/quote.dart';

class FavoriteQuoteManager
    with ChangeNotifier
    implements ValueListenable<FavoriteQuoteManager> {
  final _quotes = <Quote>[];

  List<Quote> get quotes => _quotes;

  void add(Quote quote) {
    _quotes.add(quote);
    notifyListeners();
  }

  void remove(Quote quote) {
    _quotes.remove(quote);
    notifyListeners();
  }

  bool contains(Quote quote) {
    return _quotes.contains(quote);
  }

  @override
  FavoriteQuoteManager get value => this;

  static void register() {
    GetIt.I.registerLazySingleton(() => FavoriteQuoteManager());
  }

  static FavoriteQuoteManager get instance =>
      GetIt.I.get<FavoriteQuoteManager>();
}
