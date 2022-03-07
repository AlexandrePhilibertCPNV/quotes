class Quote {
  String id;
  String body;
  String author;

  Quote(this.id, this.body, this.author);

  factory Quote.none() {
    return Quote("", "", "");
  }

  // override the equal operator
  @override
  bool operator ==(Object other) =>
      other is Quote &&
      runtimeType == other.runtimeType &&
      id == other.id &&
      body == other.body &&
      author == other.author;

  @override
  int get hashCode => body.hashCode ^ author.hashCode;
}
