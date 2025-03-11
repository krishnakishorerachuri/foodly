import 'package:foodly/constants/uidata.dart';
import 'package:foodly/models/api_error.dart';
import 'package:foodly/models/food.dart';
import 'package:foodly/models/hook_models/hook_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodly/models/restaurant.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';

FetchHook useFetchAllFoods(String code) {
  final foods = useState<List<FoodModel>?>(null);
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

        foods.value = foodModelFromJson(response.body);
      } else {
        apiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      if(e is Exception) {
        error.value = e;
      }else {
        error.value = Exception(e.toString());
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
      data: foods.value,
      isLoading: isLoading.value,
      error: error.value,
      refresh: refetch);
}
