import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  // Base URL for the API
  final String _baseUrl = 'https://9182-106-219-181-234.ngrok-free.app';

  // Method to send OTP
  Future<bool> sendOtp(String phoneNumber) async {
    final String endpoint = '$_baseUrl/sendOtp';

    try {
      // Sending POST request with form data
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded', // Set headers for form data
        },
        body: {'mobileNumber': phoneNumber}, // Send phoneNumber as form data
      );

      // Check if response is successful
      if (response.statusCode == 200) {
        print('OTP sent successfully: ${response.body}');
        return true;
      } else {
        print('Failed to send OTP: ${response.body}');
        return false;
      }
    } catch (e) {
      // Handle any exceptions
      print('Error in sendOtp: $e');
      return false;
    }
  }
  // Method to verify OTP
  Future<String> verifyOtp(String mobileNumber, String otp) async {
    final String endpoint = '$_baseUrl/verifyOtp';

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'mobileNumber': "+91 8838951470",
          'otp': otp,
        },
      );

      if (response.statusCode == 200) {
        return response.body; // Return the success message
      } else {
        return 'Invalid OTP. Please try again.'; // Default error message
      }
    } catch (e) {
      return 'Error verifying OTP. Please try again.'; // Handle any exceptions
    }
  }
}