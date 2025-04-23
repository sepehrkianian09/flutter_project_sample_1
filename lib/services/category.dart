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
  CategoryService() {
    _retrieveCategories();
  }

  final _storage = Get.find<DataStorage>();

  List<Category> _categories = [];
  final _categorySerializer = ListSerializer<Category>(CategoryParser());

  void _retrieveCategories() {
    if (_storage.containsKey('incomes')) {
      _categories = _categorySerializer.parse(_storage.get('incomes'));
    }
  }

  List<Category> getCategories() {
    return _categories.toList();
  }

  addCategory(Category aCategory) {
    _categories.add(aCategory);
    _storage.add('categories', _categorySerializer.stringify(getCategories()));
  }
}
