import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/category.dart';

class AddCategoryWidget extends StatelessWidget {
  final _controller = Get.find<CategoryController>();
  void _addCategory(BuildContext context) {
    if (_addCategoryFormKey.currentState!.saveAndValidate()) {
      _controller.addCategory(
        name: _addCategoryFormKey.currentState!.value['name'],
      );
      _addCategoryFormKey.currentState!.reset();
      Navigator.of(context).pop();
    }
  }

  final _addCategoryFormKey = GlobalKey<FormBuilderState>();

  AddCategoryWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Category"),
      content: FormBuilder(
        key: _addCategoryFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5.0,
          children: [
            FormBuilderTextField(
              name: "name",
              decoration: InputDecoration(labelText: 'Name'),
              validator: FormBuilderValidators.required(
                errorText: 'Name is required',
              ),
            ),
            ElevatedButton(
              onPressed: () => _addCategory(context),
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
