import 'dart:convert';

List<Nifty> welcomeFromJson(String str) =>
    List<Nifty>.from(json.decode(str).map((x) => Nifty.fromJson(x)));

String welcomeToJson(List<Nifty> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Nifty {
  String? symbol;
  double? open;
  double? dayHigh;
  double? dayLow;
  double? lastPrice;
  Nifty({
    required this.symbol,
    required this.open,
    required this.dayHigh,
    required this.dayLow,
    required this.lastPrice,
  });

  factory Nifty.fromJson(Map<String, dynamic> json) => Nifty(
        symbol: json["symbol"],
        open: json["open"]?.toDouble(),
        dayHigh: json["dayHigh"]?.toDouble(),
        dayLow: json["dayLow"]?.toDouble(),
        lastPrice: json["lastPrice"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "open": open,
        "dayHigh": dayHigh,
        "dayLow": dayLow,
        "lastPrice": lastPrice,
      };
}
