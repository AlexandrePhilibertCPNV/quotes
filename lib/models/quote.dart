class Quote {
  String body;
  String author;

  Quote(this.body, this.author);

  factory Quote.none() {
    return Quote("", "");
  }
}
