class MarketItem {
  final String symbol;
  final String name;
  final String nameEn;
  final dynamic price;
  final double changePercent;
  final String unit;

  MarketItem({
    required this.symbol,
    required this.name,
    required this.nameEn,
    required this.price,
    required this.changePercent,
    required this.unit,
  });

  factory MarketItem.fromJson(Map<String, dynamic> json) {
    return MarketItem(
      symbol: json['symbol'],
      name: json['name'],
      nameEn: json['name_en'],
      price: json['price'],
      changePercent: (json['change_percent'] as num).toDouble(),
      unit: json['unit'],
    );
  }
}