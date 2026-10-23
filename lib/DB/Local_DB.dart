import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDB {

  Future<Database> openDB() async {
    final path = await join(await getDatabasesPath(), 'note.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE note(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT, description TEXT)",
        );
      },
    );
  }

  Future<int> insertNote(String title, String description) async {
    final db = await openDB();
    return db.insert('note', {'title': title, 'description': description});
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final db = await openDB();
    return db.query('note');
  }

  Future<int> delete(int id) async {
    final db = await openDB();
    return db.delete('note', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(int id, String title, String description) async {
    final db = await openDB();
    return db.update(
      'note',
      {'title': title, 'description': description},
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
