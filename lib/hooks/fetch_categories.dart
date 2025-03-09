import 'package:foodly/models/api_error.dart';
import 'package:foodly/models/category.dart';
import 'package:foodly/models/hook_models/hook_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

FetchHook useFetchCategories() {
  final categoryItems = useState<List<Category>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    Uri url = Uri.parse('$appBaseUrl/api/category/random');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        categoryItems.value = categoryFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      error.value = e as Exception;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
   isLoading.value = true;
   fetchData();
  }
  
  return FetchHook(
      data: categoryItems.value,
      isLoading: isLoading.value,
      error: error.value,
      refresh: refetch);
}
