import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/search.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchString = '';
  List<Search> _searches = [];

  @override
  void initState() {
    super.initState();
    readJsonFile();
  }

  void readJsonFile() async {
    final res = await rootBundle.loadString('assets/searchlist.json');
    final json = jsonDecode(res);
    final searchRes = (json['results'] as List<dynamic>)
        .map((search) => Search.fromJson(search))
        .toList();

    setState(() {
      _searchString = res;
      _searches = searchRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final Search _search = _searches[index];
              return ListTile(
                leading: Text(_search.contentType),
                title: Text(_search.title),
                subtitle: Text(_search.date),
              );
            },
            itemCount: _searches.length,
          ),
        ),
      ),
    );
  }
}
