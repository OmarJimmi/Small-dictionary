import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';

class AddWordPage extends StatefulWidget {
  const AddWordPage({super.key});

  @override
  _AddWordPageState createState() => _AddWordPageState();
}

class _AddWordPageState extends State<AddWordPage> {
  final TextEditingController englishController = TextEditingController();
  final TextEditingController turkishController = TextEditingController();

  void _addWord() async {
    Map<String, dynamic> row = {
      'english': englishController.text,
      'turkish': turkishController.text,
      'image': 'assets\images\translator.jpg'
    };
    await DatabaseHelper().insertWord(row);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Word added to dictionary')),
    );
    englishController.clear();
    turkishController.clear();
  }

  @override
  void dispose() {
    englishController.dispose();
    turkishController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Word'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: englishController,
              decoration: const InputDecoration(labelText: 'English'),
            ),
            TextField(
              controller: turkishController,
              decoration: const InputDecoration(labelText: 'Turkish'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addWord,
              child: const Text('Add Word'),
            ),
          ],
        ),
      ),
    );
  }
}
