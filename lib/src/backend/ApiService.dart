import 'dart:convert';
import 'dart:developer';
import 'package:sugar_run/apiKey.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Uri _getUri(String endpoint) {
    return Uri.parse('https://trackapi.nutritionix.com/$endpoint');
  }


  Map<String, String> _headers() {
    return {
      "Content-Type": "application/json",
      'x-app-id': application_id,
      'x-app-key': application_key,
    };
  }
  Map <String, dynamic> body(String query_text){
    return {
      'query': query_text
    };
  }


  Future<http.Response> _sendRequest(
      Future<http.Response> Function() requestFunc, Uri uri,
      {dynamic body}) async {
    try {
      _logRequest(uri, body);
      
      final response = await requestFunc();
      _logResponse(uri, response);
      if (_isUnauthorized(response.statusCode)) {
        _handleUnauthorizedAccess();
      }
      return response;
    } catch (e) {
      log("Error during API call to $uri: $e");
      rethrow;
    }
  }

  void _logRequest(Uri uri, dynamic body) {
    if (body != null) print("Request Body: ${jsonEncode(body)}");
  }

  void _logResponse(Uri uri, http.Response response) {
    log("Response for URL: $uri");
    log("Status Code: ${response.statusCode}");
    log("Response Body: ${response.body}");
  }

  bool _isUnauthorized(int statusCode) {
    return statusCode == 401 || statusCode == 403;
  }

  void _handleUnauthorizedAccess() {
    log("Unauthorized access detected.");
  }

  Future<http.Response> post(String endpoint, dynamic body) async {
    Uri uri = _getUri(endpoint);
    return _sendRequest(
        () => http.post(uri, headers: _headers(), body: jsonEncode(body)), uri,
        body: body);
  }
}