class Quotes {
  int id;
  String quote;
  String author;

  Quotes({required this.id, required this.quote, required this.author});

  factory Quotes.fromJson(Map<String, dynamic> json) {
    return Quotes(id: json['id'], quote: json['quote'], author: json['author']);
  }
}

class QuoteModel {
  List<Quotes> quotes;
  int total;
  int skip;
  int limit;

  QuoteModel(
      {required this.quotes,
      required this.total,
      required this.skip,
      required this.limit});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    List<Quotes> allQuotes = [];

    for (Map<String, dynamic> eachJson in json['quotes']) {
      Quotes quote = Quotes.fromJson(eachJson);
      allQuotes.add(quote);
    }
    return QuoteModel(
        quotes: allQuotes,
        total: json['total'],
        skip: json['skip'],
        limit: json['limit']);
  }
}
