import 'package:get/get.dart';
import 'package:project_1/models/category.dart';
import 'package:project_1/services/category.dart';

class CategoryController {
  final _categoryService = Get.find<CategoryService>();

  List<Category> getCategories() {
    return _categoryService.getCategories();
  }

  void addCategory({required String name}) {
    if (containsCategory(name)) {
      throw "Repeated category";
    }

    final theCategory = Category(name: name);
    _categoryService.addCategory(theCategory);
    categories.add(theCategory);
  }

  bool containsCategory(String categoryName) {
    return categories.any((category) => category.name == categoryName);
  }

  RxList<Category> categories;
  CategoryController() : categories = <Category>[].obs {
    categories.value = _categoryService.getCategories();
  }
}
