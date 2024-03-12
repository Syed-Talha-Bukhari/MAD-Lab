import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

abstract class BaseApiService {
  Future<dynamic> getPostApiResponse(String url, dynamic data);
  Future<dynamic> getGetApiResponse(String url);
}

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic returnResponse;
    try {
      final response = await http.get(Uri.parse(url));
      returnResponse = this.returnResponse(response);
    } on SocketException {
      throw FetchDataException('No connection');
    }
    return returnResponse;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Connection.');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    print('Response Status Code: ${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        String errorString = response.body;
        throw BadRequestException(response.body);
      case 404:
        throw UnauthorizedException(response.body);
      case 403:
        throw UnauthorizedException(response.body);
      case 500:
      default:
        throw FetchDataException(
            'Error occured. Code : ${response.statusCode}');
    }
  }
}

class AppExceptions implements Exception {
  final String? _message;
  final String? _prefix;

  AppExceptions(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message])
      : super(message, "Error in Communication: ");
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message, "Invalid Request: ");
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message])
      : super(message, "Unauthorized Request: ");
}

class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message])
      : super(message, "Unauthorized Input: ");
}

class GetJson {
  List<Results>? results;

  GetJson({this.results});

  GetJson.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? url;
  String? title;
  String? contentType;
  List<String>? tags;
  String? date;

  Results({this.url, this.title, this.contentType, this.tags, this.date});

  Results.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    contentType = json['contentType'];
    tags = json['tags'].cast<String>();
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['title'] = title;
    data['contentType'] = contentType;
    data['tags'] = tags;
    data['date'] = date;
    return data;
  }
}

class GetRepository {
  final BaseApiService _baseApiService = NetworkApiService();
  Future<GetJson> getJson() async {
    try {
      return await _baseApiService
          .getGetApiResponse('https://codewithandrea.com/search/search.json')
          .then((value) => GetJson.fromJson(value));
    } catch (e) {
      print('Post Repository Error: $e');
      rethrow;
    }
  }
}

void main() async {
  final GetJson getJson = await GetRepository().getJson();
  print(getJson.results![0].title);
}
