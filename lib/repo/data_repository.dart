import 'package:allflutter/api/api_service.dart';

class DataRepository {
  final ApiService apiService;

  DataRepository(this.apiService);

  Future<dynamic> fetchData() async {
    return await apiService.fetchData("/todos/1");
  }
}
