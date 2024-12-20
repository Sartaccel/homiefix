import 'dart:convert';
import 'package:homiefix_application/data/models/price_model.dart';
import 'package:http/http.dart' as http;


class PriceRepository {
  final String baseUrl;

  PriceRepository({required this.baseUrl});

  Future<PriceResponse> fetchPrice(String serviceName) async {
    final url = Uri.parse('https://6147-106-219-181-200.ngrok-free.app/services/name/AC/price');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return PriceResponse.fromJson(data);
      } else {
        throw Exception('Failed to load price: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching price: $e');
    }
  }
}
