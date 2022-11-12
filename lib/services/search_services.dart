import 'package:dio/dio.dart';
import 'package:saffron_hub/models/vendors_model.dart';
import 'package:saffron_hub/consts/base_url.dart';

class SearchServices {
  final _dio = Dio();

  Future<Vendors> searchFor(String? content) async {
    try {
      final Map<String, dynamic> data = {'search': content};
      final formData = FormData.fromMap(data);

      const url = '${AppConstants.baseUrl}food-vendors/search';
      final response = await _dio.post(
        url,
        data: formData,
      );
      if (response.statusCode != 200) {
        throw response.data;
      }
      print('Searched data : ${response.data}');
      return Vendors.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }
}
