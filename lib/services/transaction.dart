import 'package:get/get.dart';
import 'package:project_1/dataStorage/interface.dart';
import 'package:project_1/models/income.dart';
import 'package:project_1/models/spend.dart';

import 'parser.dart';

class SpendParser extends ObjectParser<Spend> {
  @override
  Spend fromJson(Map<String, dynamic> aTJSon) {
    return Spend(
      amount: double.parse(aTJSon['amount']),
      date: DateTime.parse(aTJSon['date']),
      categoryId: aTJSon['categoryId'],
    );
  }

  @override
  Map<String, dynamic> toJson(Spend aT) {
    return {
      'amount': aT.amount.toString(),
      'date': aT.date.toString(),
      'categoryId': aT.categoryId,
    };
  }
}

class IncomeParser extends ObjectParser<Income> {
  @override
  Income fromJson(Map<String, dynamic> aTJSon) {
    return Income(
      amount: double.parse(aTJSon['amount']),
      date: DateTime.parse(aTJSon['date']),
    );
  }

  @override
  Map<String, dynamic> toJson(Income aT) {
    return {'amount': aT.amount.toString(), 'date': aT.date.toString()};
  }
}

class TransactionService {
  TransactionService() {
    _retrieveIncomes();
    _retrieveSpends();
  }

  final _storage = Get.find<DataStorage>();

  List<Income> _incomes = [];
  final _incomeSerializer = ListSerializer<Income>(IncomeParser());

  void _retrieveIncomes() {
    if (_storage.containsKey('incomes')) {
      _incomes = _incomeSerializer.parse(_storage.get('incomes'));
    }
  }

  List<Income> getIncomes() {
    return _incomes.toList();
  }

  addIncome(Income anIncome) {
    _incomes.add(anIncome);
    _storage.add('incomes', _incomeSerializer.stringify(_incomes));
  }


  List<Spend> _spends = [];
  final _spendSerializer = ListSerializer<Spend>(SpendParser());

  void _retrieveSpends() {
    if (_storage.containsKey('spends')) {
      _spends = _spendSerializer.parse(_storage.get('spends'));
    }
  }

  List<Spend> getSpends() {
    return _spends.toList();
  }

  addSpend(Spend aSpend) {
    _spends.add(aSpend);
    _storage.add('spends', _spendSerializer.stringify(_spends));
  }
}
