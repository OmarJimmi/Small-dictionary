import 'package:flutter/material.dart';
import 'DatabaseHelper.dart';

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseHelper().getWords(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No words found.'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var word = snapshot.data![index];
              return ListTile(
                title: Text(word['english']),
                subtitle: Text(word['turkish']),
                leading: Image.asset(
                  'assets/images/english_flag.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
