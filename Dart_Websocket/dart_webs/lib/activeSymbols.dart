// ignore_for_file: non_constant_identifier_names

class CheckActiveSymbols {
  final String display_name;
  final String market;
  final String symbol;

  CheckActiveSymbols(
      {required this.display_name, required this.market, required this.symbol});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['display_name'] = display_name;
    data['market'] = market;
    data['symbol'] = symbol;
    return data;
  }

  factory CheckActiveSymbols.fromJson(json) {
    return CheckActiveSymbols(
        display_name: json['display_name'],
        market: json["market"],
        symbol: json['symbol']);
  }
}
