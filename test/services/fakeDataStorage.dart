import 'package:project_1/dataStorage/interface.dart';

class FakeDataStorage implements DataStorage {
  final _storage = <String, dynamic>{};

  @override
  void add(String key, value) {
    _storage[key] = value;
  }

  @override
  bool containsKey(String key) {
    return _storage.containsKey(key);
  }

  @override
  get(String key) {
    return _storage[key];
  }

  @override
  void remove(String key) {
    _storage.remove(key);
  }
}
