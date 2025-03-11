import 'package:foodly/models/api_error.dart';
import 'package:foodly/models/food.dart';
import 'package:foodly/models/hook_models/hook_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

FetchHook useFetchFoods(String code) {
  final foodModel = useState<List<FoodModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    Uri url = Uri.parse('$appBaseUrl/api/foods/recommendation/$code');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(foodModelFromJson(response.body));
        foodModel.value = foodModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      if(e is Exception) {
        error.value = e;
      }else {
        error.value = Exception(e.toString());
        error.value = Exception("Failed to fetch foods: ${e.toString()}");

      }
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
      data: foodModel.value,
      isLoading: isLoading.value,
      error: error.value,
      refresh: refetch);
}
