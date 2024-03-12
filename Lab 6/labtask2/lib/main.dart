

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: const RandomWords(),
    );
  }
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  // Rename to selected items
  final _selected = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: [
          // Update the delete icon and functionality
          IconButton(
            icon: const Icon(Icons.delete),
            // Show snackbar if zero selected otherwise prompt dialog
            onPressed:
                _selected.isEmpty ? _showSnackbar : _showDeleteSelectedDialog,
            tooltip: 'Delete Selected',
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }

          final alreadySaved = _selected.contains(_suggestions[index]);

          return ListTile(
            title: Text(
              _suggestions[index].asPascalCase,
              style: _biggerFont,
            ),
            // Update to checkmark icon if selected
            trailing: alreadySaved
                ? const Icon(
                    Icons.check,
                    color: Colors.greenAccent,
                    semanticLabel: 'Remove from selected',
                  )
                : null,

            onTap: () {
              setState(() {
                if (alreadySaved) {
                  _selected.remove(_suggestions[index]);
                } else {
                  _selected.add(_suggestions[index]);
                }
              });
            },
          );
        },
      ),
    );
  }

  Future<void> _showDeleteSelectedDialog() async {
    showDialog(
      // Restrict tapping outside to dismiss dialog
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // List down the selected pairs to display in dialog
        final pairs =
            _selected.map((pair) => "\"${pair.asPascalCase}\"").join(" ");
        return AlertDialog(
          title: Text("Would you like to delete $pairs?"),
          actions: [
            TextButton(
              onPressed: () {
                // Remove the selected items from the suggestions list
                setState(() {
                  _suggestions
                      .removeWhere((element) => _selected.contains(element));
                  // Clear the selected list
                  _selected.clear();
                });

                // Dismiss the dialog
                Navigator.of(context).pop();
              },
              child: const Text("Yes"),
            ),
            // Dismiss the dialog on selecting "No"
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }

  // Prompt to show the snackbar on no selected items
  void _showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("No Items Selected!"),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}
