import 'package:flutter/material.dart';
import '/database/db_helper.dart';
import '/models/note.dart';

// quản lý ghi chú và thông báo khi có thay đổi
class NoteProvider extends ChangeNotifier {
  final _db = DataBaseHelper.instance;
  // hàm list để lưu trữ các note
  List<Note> _notes = [];
  List<Note> get notes => _notes;
  // load tất cả các note từ database
  Future<void> loadNotes() async {
    _notes = await _db.getAll();
    notifyListeners();
  }

  // hàm thêm note mới
  Future<void> add(Note note) async {
    await _db.insert(note);
    await loadNotes();
  }

  // hàm cập nhật note
  Future<void> updateNote(Note note) async {
    note.updatedAt = DateTime.now();
    await _db.update(note);
    await loadNotes();
  }

  // xóa note
  Future<void> remove(int id) async {
    await _db.delete(id);
    await loadNotes();
  }
}
