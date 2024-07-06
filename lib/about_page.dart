import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1532072994056-8f250af7b34b?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDJ8fGFi-b3V0JTIwdXN8ZW58MHx8fHwxNjU0NDU4Mzc2&ixlib=rb-1.2.1&q=80&w=400"),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'We are Omar and Wail',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'This app is designed to teach the Turkish language. It includes a comprehensive dictionary from Turkish to English, aiming to make language learning accessible and enjoyable. Users can also create their own translations to enhance their learning experience.',
              style: TextStyle(fontSize: 18, height: 1.5),
            ),
            const SizedBox(height: 16),
            const Text(
              'Project Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            const Text(
              'This project is a collaboration with Dr. Nasser as part of the Mobile Application course. We hope you find it useful and engaging!',
              style: TextStyle(fontSize: 18, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
