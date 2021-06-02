import 'package:http/http.dart' as http;
import 'dart:convert';

class CoinConverter {
  Future<dynamic> getExchangeRate(String base, String quote) async {
    var url = Uri.parse('https://rest.coinapi.io/v1/exchangerate/$base/$quote');
    http.Response response = await http.get(url, headers: {
      'X-CoinAPI-Key': '',
    });
    var data = jsonDecode(response.body);
    return data['rate'];
  }

  Future<String> getConvertedRate(
      String base, String quote, String baseValue) async {
    double value = double.tryParse(baseValue);
    if (value == null || value == 0) {
      return '0';
    }
    double exchangeRate = await getExchangeRate(base, quote);
    double convertedValue = value * exchangeRate;
    return convertedValue.toStringAsPrecision(10);
  }
}
