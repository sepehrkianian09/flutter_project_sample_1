import 'package:get/get.dart';
import 'package:project_1/controllers/category.dart';
import 'package:project_1/controllers/wallet.dart';

class StatisticsController {
  final _walletController = Get.find<WalletController>();

  final _categoryController = Get.find<CategoryController>();

  Map<String, double> getTotalSpentPerCategory() {
    final categories = _categoryController.getCategories();
    final spends = _walletController.getSpends();

    final totalSpentPerCategory = <String, double>{};

    for (var category in categories) {
      totalSpentPerCategory[category.name] = 0.0;
    }

    for (var spend in spends) {
      totalSpentPerCategory[spend.categoryId] =
          totalSpentPerCategory[spend.categoryId]! + spend.amount;
    }

    return totalSpentPerCategory;
  }
}
