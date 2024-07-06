import 'package:flutter/material.dart';
import 'add_word_page.dart';
import 'dictionary_page.dart';
import 'about_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DictionaryPage(),
    AddWordPage(),
    ProfilePage(),
    AboutPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('English-Turkish Dictionary'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.book),
            label: 'Dictionary',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.add),
            label: 'Add Word',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}
