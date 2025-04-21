import 'package:get/get.dart';
import 'package:project_1/controllers/category.dart';
import 'package:project_1/models/income.dart';
import 'package:project_1/models/spend.dart';
import 'package:project_1/services/transaction.dart';

class WalletController {
  final _categoryController = Get.find<CategoryController>();
  final _transactionService = Get.find<TransactionService>();

  List<Spend> getSpends() {
    return [
      Spend(
        amount: 2.0,
        date: DateTime(2020, 10, 3, 10, 20, 3),
        categoryId: '1',
      ),
      Spend(
        amount: 4.0,
        date: DateTime(2016, 2, 5, 3, 56, 20),
        categoryId: '2',
      ),
    ];
  }

  spendMoney({
    required double amount,
    DateTime? date,
    required String categoryId,
  }) {
    if (amount <= 0) {
      throw "Amount Invalid";
    }
    if (amount > getBalance()) {
      throw "Inadequate balance";
    }
    if (!_categoryController.containsCategory(categoryId)) {
      throw "Category Not Found";
    }

    final theDate = date ?? DateTime.now();

    _transactionService.addSpend(
      Spend(amount: amount, date: theDate, categoryId: categoryId),
    );
  }

  List<Income> getIncomes() {
    return [
      Income(amount: 2.0, date: DateTime(2020, 10, 3, 10, 20, 3)),
      Income(amount: 4.0, date: DateTime(2016, 2, 5, 3, 56, 20)),
    ];
  }

  addIncome({required double amount, DateTime? date}) {
    if (amount <= 0) {
      throw "Amount Invalid";
    }

    final theDate = date ?? DateTime.now();

    _transactionService.addIncome(Income(amount: amount, date: theDate));
  }

  static double _sum(Iterable<double> aList) {
    return aList.reduce((a, b) => a + b);
  }

  double getBalance({DateTime? date}) {
    final incomeAmount = _sum(getIncomes().map((income) => income.amount));
    final spendAmount = _sum(getSpends().map((spend) => spend.amount));

    return incomeAmount - spendAmount;
  }
}
