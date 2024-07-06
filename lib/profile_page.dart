import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _turkishLevel = 'Beginner';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Omar',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'omar@hotmail.com',
                style: TextStyle(fontSize: 20, color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Contact Information',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.grey[400]),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+966(553586904)'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Address'),
              subtitle: Text('123 loka Street, Jeddah, Saudi'),
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Job'),
              subtitle: Text('Software Developer at CIU'),
            ),
            SizedBox(height: 30),
            Text(
              'Turkish Level',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.grey[400]),
            Center(
              child: Column(
                children: [
                  Text(
                    _turkishLevel,
                    style: TextStyle(fontSize: 20, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 10),
                  DropdownButton<String>(
                    value: _turkishLevel,
                    items: <String>['Beginner', 'Intermediate', 'Advanced']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _turkishLevel = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
