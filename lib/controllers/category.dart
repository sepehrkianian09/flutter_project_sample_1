import 'package:get/get.dart';
import 'package:project_1/models/category.dart';
import 'package:project_1/services/category.dart';

class CategoryController {
  final _service = Get.find<CategoryService>();

  List<Category> getCategories() {
    return _service.getCategories();
  }

  void addCategory(String name) {
    if (containsCategory(name)) {
      throw "Repeated category";
    }

    _service.addCategory(Category(name: name));
  }

  bool containsCategory(String categoryName) {
    return getCategories().any((category) => category.name == categoryName);
  }
}
