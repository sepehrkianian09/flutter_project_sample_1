import 'interface.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class HiveDataStorage implements DataStorage {
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox("storage");
  }

  get storage => Hive.box("storage");

  @override
  void add(String key, value) {
    storage.put(key, value);
  }

  @override
  bool containsKey(String key) {
    return storage.containsKey(key);
  }

  @override
  get(String key) {
    return storage.get(key);
  }

  @override
  void remove(String key) {
    storage.delete(key);
  }
}
