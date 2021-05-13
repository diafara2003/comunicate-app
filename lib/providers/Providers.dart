import 'dart:convert';
import 'dart:io';

import 'package:comunicate_colegios_app/models/person_models.dart';
import 'package:comunicate_colegios_app/services/Auth/login_provider.dart';
import 'package:http/http.dart' as http;

import '../services/Auth/PreferenciasUsuario.dart';

class Providers {
  String _getToken() {
    PreferenciasUsuario _prefe = new PreferenciasUsuario();

    return _prefe.token;
  }

  Future<bool> verificarSession() async {
    dynamic _userLogged = new PreferenciasUsuario().usuario;

    if (_userLogged == null) return false;

    Usuario _session = Usuario.fromJson(_userLogged);
    Usuario _user = await new LoginProvider()
        .validationUser(_session.perDocumento, _session.perClave);

    if (_user != null)
      return true;
    else
      return false;
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
