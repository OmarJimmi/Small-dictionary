import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'dictionary.db');
    return await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE words(id INTEGER PRIMARY KEY, english TEXT, turkish TEXT, image TEXT)',
        );
        await populateDatabase(db);
      },
      version: 1,
    );
  }

  Future<void> populateDatabase(Database db) async {
    List<Map<String, dynamic>> initialWords = [
      {
        'english': 'Hello',
        'turkish': 'Merhaba',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'Goodbye',
        'turkish': 'Hoşçakal',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'Thank you',
        'turkish': 'Teşekkür ederim',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'Please',
        'turkish': 'Lütfen',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'Yes',
        'turkish': 'Evet',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'No',
        'turkish': 'Hayır',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'Good morning',
        'turkish': 'Günaydın',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'Good afternoon',
        'turkish': 'Tünaydın',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'Good evening',
        'turkish': 'İyi akşamlar',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'Excuse me',
        'turkish': 'Affedersiniz',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'Sorry',
        'turkish': 'Üzgünüm',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'How are you?',
        'turkish': 'Nasılsınız?',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'What is your name?',
        'turkish': 'Adınız nedir?',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'My name is...',
        'turkish': 'Benim adım...',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'I don\'t understand',
        'turkish': 'Anlamıyorum',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'Where is...?',
        'turkish': '...nerede?',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'How much is this?',
        'turkish': 'Bu ne kadar?',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'I love you',
        'turkish': 'Seni seviyorum',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'Good luck',
        'turkish': 'İyi şanslar',
        'image': 'assets/images/translator.jpg'
      },
      {
        'english': 'Cheers!',
        'turkish': 'Şerefe!',
        'image': 'assets/images/translator.jpg'
      }
    ];

    for (var word in initialWords) {
      await db.insert(
        'words',
        word,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print('Inserted: ${word['english']} - ${word['turkish']}');
    }
  }

  Future<void> insertWord(Map<String, dynamic> word) async {
    final db = await database;
    await db.insert(
      'words',
      word,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getWords() async {
    final db = await database;
    return await db.query('words');
  }
}
