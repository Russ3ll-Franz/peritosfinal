import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:peritosapp/shared/http/http_exceptions.dart';

final apiProvider = Provider<HttpMethodsType>(
  (ref) => HttpMethodsType(ref.read),
);

class HttpMethodsType {
  HttpMethodsType(this._reader) {}

  final Reader _reader;
  final _baseUrl = 'https://allemantperitos.com.pe/appsgi/';

  Future<dynamic> get(String url) async {
    try {
      Uri _uri = Uri.parse(_baseUrl);
      return await http.get(_uri).then((response) => _returnResponse(response));
    } on SocketException {
      print('No net');
      throw const HttpExceptionFetchData('No Internet connection');
    }
  }

  Future<dynamic> post(String apiUrl, dynamic body) async {
    print('Api Post, url $apiUrl');
/*     String _finalUrl = (_baseUrl + apiUrl);
 */
    final url = Uri.https(_baseUrl, apiUrl);

    /* Uri _uri = Uri.parse(_finalUrl); */
    print('Api Post, my $url');

    try {
      return await http.post(url, body: body).then((response) => _returnResponse);
    } on SocketException {
      print('No net');
      throw const HttpExceptionFetchData('No Internet connection');
    }
  }

  Future<dynamic> put(String apiUrl, dynamic body) async {
    String _finalUrl = (_baseUrl + apiUrl);
    Uri _uri = Uri.parse(_finalUrl);
    try {
      return await http.put(_uri, body: body).then((response) => _returnResponse(response));
    } on SocketException {
      print('No net');
      throw const HttpExceptionFetchData('No Internet connection');
    }
  }

  Future<dynamic> delete(String apiUrl) async {
    String _finalUrl = (_baseUrl + apiUrl);
    Uri _uri = Uri.parse(_finalUrl);
    try {
      return await http.delete(_uri).then((response) => _returnResponse(response));
    } on SocketException {
      print('No net');
      throw const HttpExceptionFetchData('No Internet connection');
    }
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      print('api get recieved!');
      print(responseJson);
      return responseJson;
    case 400:
      throw HttpExceptionBadRequest(response.body.toString());
    case 401:
    case 403:
      throw HttpExceptionUnauthorised(response.body.toString());
    case 500:
    default:
      throw HttpExceptionFetchData('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
