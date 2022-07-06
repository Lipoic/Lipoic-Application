import 'package:http/http.dart' as http;
import 'package:lipoic/src/api/api_response.dart';
import 'package:lipoic/src/config/config.dart';

class HttpClient {
  final String baseUrl;
  final http.Client _client;

  HttpClient({required this.baseUrl, http.Client? client})
      : _client = client ?? http.Client();

  /// Development environment client
  factory HttpClient.dev() =>
      HttpClient(baseUrl: 'https://lipoic-test-server.herokuapp.com');

  // TODO: change the url to api.lipoic.org
  /// Production environment client
  factory HttpClient.prod() =>
      HttpClient(baseUrl: 'https://lipoic-server.herokuapp.com');

  Future<Response<T>> _request<T>(
      {required String method,
      required String path,
      Map<String, dynamic>? query,
      Object? body,
      String? token,
      Map<String, String> headers = const {}}) async {
    token ??= appConfig.token;
    final Uri uri =
        Uri.parse(baseUrl + (path.startsWith('/') ? path : '/$path')).replace(
            query: query?.entries
                .where((e) => e.value != null)
                .map((e) => '${e.key}=${e.value}')
                .join('&'));

    final http.Response response;
    headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
      'User-Agent': 'RPMTW-Application',
    });

    if (method == 'GET') {
      response = await _client.get(uri, headers: headers);
    } else if (method == 'POST') {
      response = await _client.post(uri, headers: headers, body: body);
    } else if (method == 'PATCH') {
      response = await _client.patch(uri, headers: headers, body: body);
    } else if (method == 'DELETE') {
      response = await _client.delete(uri, headers: headers, body: body);
    } else {
      throw Exception('Invalid method: $method');
    }

    return Response.fromJson(response.body);
  }

  Future<Response<T>> get<T>(String path,
          {Map<String, dynamic>? query,
          String? token,
          Map<String, String> headers = const {}}) =>
      _request<T>(
          method: 'GET',
          path: path,
          query: query,
          token: token,
          headers: headers);

  Future<Response<T>> post<T>(String path,
          {Map<String, dynamic>? query,
          Object? body,
          String? token,
          Map<String, String> headers = const {}}) =>
      _request<T>(
          method: 'POST',
          path: path,
          query: query,
          body: body,
          token: token,
          headers: headers);

  Future<Response<T>> patch<T>(String path,
          {Map<String, dynamic>? query,
          Object? body,
          String? token,
          Map<String, String> headers = const {}}) =>
      _request<T>(
          method: 'PATCH',
          path: path,
          query: query,
          body: body,
          token: token,
          headers: headers);

  Future<Response<T>> delete<T>(String path,
          {Map<String, dynamic>? query,
          Object? body,
          String? token,
          Map<String, String> headers = const {}}) =>
      _request<T>(
          method: 'DELETE',
          path: path,
          query: query,
          body: body,
          token: token,
          headers: headers);
}
