import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/wallet.dart';

class AddSpendWidget extends StatelessWidget {
  final _controller = Get.find<WalletController>();
  void _addSpend(BuildContext context) {
    if (_addSpendFormKey.currentState!.saveAndValidate()) {
      _controller.spendMoney(
        amount: _addSpendFormKey.currentState!.value['amount'],
        date: _addSpendFormKey.currentState!.value['date'],
        categoryId: _addSpendFormKey.currentState!.value['categoryId'],
      );
      _addSpendFormKey.currentState!.reset();
      Navigator.of(context).pop();
      Get.offNamed(Get.currentRoute, arguments: Get.arguments);
    }
  }

  final _addSpendFormKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Spend Some"),
      content: FormBuilder(
        key: _addSpendFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5.0,
          children: [
            FormBuilderTextField(
              name: "amount",
              decoration: InputDecoration(
                labelText: 'Amount',
                hintText: 'Enter a double number',
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: 'Amount is required'),
                FormBuilderValidators.numeric(
                  errorText: 'Enter a valid number',
                ),
              ]),
              valueTransformer: (val) => double.tryParse(val ?? ''),
            ),
            FormBuilderDateTimePicker(
              name: 'date',
              inputType: InputType.both, // options: date, time, both
              decoration: InputDecoration(
                labelText: 'Select Date & Time',
                border: OutlineInputBorder(),
              ),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            ),
            FormBuilderTextField(
              name: "categoryId",
              decoration: InputDecoration(labelText: 'Category'),
              validator: FormBuilderValidators.required(
                errorText: 'Category is required',
              ),
            ),
            ElevatedButton(onPressed: ()=> _addSpend(context), child: Text("Add")),
          ],
        ),
      ),
    );
  }
}
