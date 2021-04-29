import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'Auth/PreferenciasUsuario.dart';

class Providers {
  String _getToken() {
    PreferenciasUsuario _prefe = new PreferenciasUsuario();

    return _prefe.token;
  }

  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  final String _base = 'https://www.comunicatecolegios.com/api/';

  Future<String> getAPI(String _url, {int allowAnonymous = 0}) async {
    String baseURL = _base + _url;

    http.Response response;

    if (allowAnonymous == 0) {
      final token = _getToken();

      response = await http.get(
        baseURL,
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      );
    } else
      response = await http.get(baseURL);

    return (response.body);
  }

  Future<Map<String, dynamic>> postAPI(
      String _url, Object object, int allowAnonymous) async {
    final baseURL = _base + _url;
    final token = _getToken();

    http.Response response;

    if (allowAnonymous == 1)
      response = await http.post(baseURL,
          headers: requestHeaders, body: json.encode(object));
    else {
      response = await http.post(baseURL, body: json.encode(object), headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token"
      });
    }

    return jsonDecode(response.body);
  }
}
