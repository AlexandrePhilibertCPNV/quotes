import 'package:quotes/models/quote.dart';

abstract class QuoteProvider {
  Future<Quote> fetch();
}
