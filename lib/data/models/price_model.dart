class PriceResponse {
  final double price;

  PriceResponse({required this.price});

  // Factory constructor to parse JSON response
  factory PriceResponse.fromJson(Map<String, dynamic> json) {
    return PriceResponse(
      price: json['price'] as double,
    );
  }
}
