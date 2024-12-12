import 'dart:convert';
import 'package:homiefix_application/data/models/coupon_model_dart';
import 'package:http/http.dart' as http;


class CouponRepository {
  final String apiUrl = 'https://your-api-url.com/getCoupons';

  Future<List<Coupon>> fetchCoupons() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => Coupon.fromJson(item)).toList(); 
    } else {
      throw Exception('Failed to load coupons');
    }
  }
}



