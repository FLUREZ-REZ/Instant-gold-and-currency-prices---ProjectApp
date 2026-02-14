import 'gold-api-model.dart';


class MarketResponse {
  final List<MarketItem> gold;
  final List<MarketItem> currency;
  final List<MarketItem> crypto;

  MarketResponse({
    required this.gold,
    required this.currency,
    required this.crypto,
  });

  factory MarketResponse.fromJson(Map<String, dynamic> json) {
    return MarketResponse(
      gold: (json['gold'] as List)
          .map((e) => MarketItem.fromJson(e))
          .toList(),

      currency: (json['currency'] as List)
          .map((e) => MarketItem.fromJson(e))
          .toList(),

      crypto: (json['cryptocurrency'] as List)
          .map((e) => MarketItem.fromJson(e))
          .toList(),
    );
  }
}