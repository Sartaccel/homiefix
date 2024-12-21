import 'dart:convert';
import 'package:http/http.dart' as http;

class AddressRepository {
  static const String baseUrl = "https://api.example.com"; 
  
  // Fetch all addresses
  static Future<List<Map<String, dynamic>>> fetchAddresses() async {
    final response = await http.get(Uri.parse("$baseUrl/addresses"));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception("Failed to load addresses");
    }
  }

  // Add a new address
  static Future<void> addAddress(Map<String, dynamic> addressData) async {
    final response = await http.post(
      Uri.parse("$baseUrl/addresses"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(addressData),
    );
    if (response.statusCode != 201) {
      throw Exception("Failed to add address");
    }
  }

  // Update an address
  static Future<void> updateAddress(String id, Map<String, dynamic> addressData) async {
    final response = await http.put(
      Uri.parse("$baseUrl/addresses/$id"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(addressData),
    );
    if (response.statusCode != 200) {
      throw Exception("Failed to update address");
    }
  }

  // Delete an address
  static Future<void> deleteAddress(String id) async {
    final response = await http.delete(Uri.parse("$baseUrl/addresses/$id"));
    if (response.statusCode != 200) {
      throw Exception("Failed to delete address");
    }
  }
}
