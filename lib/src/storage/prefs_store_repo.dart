// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../adapter/iadapter.dart';
import 'interface/istore_repo.dart';
import 'interface/serializable.dart';

abstract class PrefsStoreRepo<T extends Serializable> implements IStoreRepo<T> {
  final SharedPreferences prefs;
  final String key;
  final IAdapter<T, Map<String, dynamic>> adapter;

  PrefsStoreRepo({
    required this.prefs,
    required this.key,
    required this.adapter,
  });

  @override
  Future<void> save(T data) async {
    await prefs.setString(key, jsonEncode(data.toMap()));
  }

  @override
  Future<void> clear() => prefs.remove(key);

  @override
  Future<T?> fetch() async {
    final data = prefs.getString(key);
    if (data == null) return null;
    return adapter.convert(jsonDecode(data));
  }
}
