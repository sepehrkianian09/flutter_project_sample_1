import 'package:get/get.dart';
import 'package:project_1/dataStorage/interface.dart';
import 'package:project_1/models/category.dart';

import 'parser.dart';

class CategoryParser extends ObjectParser<Category> {
  @override
  Category fromJson(Map<String, dynamic> aTJSon) {
    return Category(name: aTJSon['name']);
  }

  @override
  Map<String, dynamic> toJson(Category aT) {
    return {'name': aT.name};
  }
}

class CategoryService {
  final _storage = Get.find<DataStorage>();

  final _categorySerializer = ListSerializer<Category>(CategoryParser());

  List<Category>? _categories;
  List<Category> getCategories() {
    if (_categories == null) {
      if (_storage.containsKey('categories')) {
        _categories = _categorySerializer.parse(_storage.get('categories'));
      } else {
        _categories = [];
      }
    }
    return _categories!;
  }

  addCategory(Category aCategory) {
    getCategories().add(aCategory);
    _storage.add('categories', _categorySerializer.stringify(getCategories()));
  }
}
