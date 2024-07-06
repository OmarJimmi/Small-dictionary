import 'package:flutter/material.dart';

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _words = [
    'hello - merhaba',
    'world - dünya',
    // Add more words here
  ];
  List<String> _filteredWords = [];

  @override
  void initState() {
    super.initState();
    _filteredWords = _words;
  }

  void _search(String query) {
    setState(() {
      _filteredWords = _words
          .where((word) => word.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English-to-Turkish Dictionary'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(labelText: 'Search'),
              onChanged: _search,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredWords.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredWords[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
