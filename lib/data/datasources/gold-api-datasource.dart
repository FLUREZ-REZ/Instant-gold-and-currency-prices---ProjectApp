import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/gold-api-items.dart';




class ApiService {
  static const String url =
      "https://brsapi.ir/Api/Market/Gold_Currency.php?key=B6u7aNED8lkr28jyX6TwgAMhHCYft8q2";

  static Future<MarketResponse> fetchMarketData() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return MarketResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("خطا در دریافت اطلاعات");
    }
  }
}