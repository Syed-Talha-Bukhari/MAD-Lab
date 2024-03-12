import 'dart:convert';
import 'package:http/http.dart' as http;

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


void main() async {
  final res = await http.get(Uri.parse('https://codewithandrea.com/search/search.json'));
  print("Status Code: ${res.statusCode}");
  var resJson = jsonDecode(res.body);
  var model = GetJson.fromJson(resJson);
  print('1st Result Title: ${model.results![0].title}');
}
