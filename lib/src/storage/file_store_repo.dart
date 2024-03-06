// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../adapter/iadapter.dart';
import 'interface/istore_repo.dart';
import 'interface/serializable.dart';

class FileStoreRepo<T extends Serializable> implements IStoreRepo<T> {
  final String filename;
  final IAdapter<T, Map<String, dynamic>> adapter;
  FileStoreRepo({
    required this.filename,
    required this.adapter,
  });

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$filename.json');
  }

  @override
  Future<void> clear() async {
    final file = await _localFile;
    if (file.existsSync()) {
      await file.delete();
    }
  }

  @override
  Future<T?> fetch() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return adapter.convert(jsonDecode(contents));
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> save(T data) async {
    final file = await _localFile;
    await file.writeAsString(jsonEncode(data.toMap()));
  }
}
