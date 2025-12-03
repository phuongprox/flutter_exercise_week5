import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '/models/note.dart';

// khởi tạo và quản lý cơ sở dữ liệu bằng SQLite
class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._();
  DataBaseHelper._();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    //trả về database đã tạo
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, 'notes.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE notes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            content TEXT,
            createdAt INTEGER,
            updatedAt INTEGER
          )
        ''');
      },
    );
  }

  // các phương thức CRUD
  Future<int> insert(Note note) async {
    final db = await database;
    return db.insert('notes', note.toMap());
  }

  Future<List<Note>> getAll() async {
    final db = await database;
    final result = await db.query('notes', orderBy: 'updatedAt DESC');
    return result.map((e) => Note.fromMap(e)).toList();
  }

  Future<int> update(Note note) async {
    final db = await database;
    return db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await database;
    return db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
