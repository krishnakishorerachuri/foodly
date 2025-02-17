import 'package:get/get.dart';

class CategoryController extends GetxController {

  RxString _category = ''.obs;

  String get categoryValue => _category.value;

  set updateCategory(String newValue) {
    _category.value = newValue;
  }

  RxString _title = ''.obs;

  String get titleValue => _title.value;

  set updateTitle(String newValue) {
    _title.value = newValue;
  }

}
