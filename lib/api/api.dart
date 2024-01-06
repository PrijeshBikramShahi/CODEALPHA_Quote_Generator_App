import 'dart:convert';

import 'package:quotes_app/quote_gen.dart';
import 'package:http/http.dart' as http;

class Api {

  static const baseQuoteUrl = 'https://zenquotes.io/api/';
  static Future<QuotesGetter> fetchRanQuote() async {
    final response = await http.get(Uri.parse("${baseQuoteUrl}random"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return QuotesGetter.fromJson(data[0]);
    } else {
      throw Exception("Failed to get API");
    }
  }

  
}
