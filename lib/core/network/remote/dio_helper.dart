import 'package:dio/dio.dart';
import 'package:hospital_management_system/core/widgets/custom_toast_widget.dart';

class DioHelper {
  static Dio? dio;
  static String baseUrl = "http://127.0.0.1:8000/api/";

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<dynamic> getData({
    required String endpoint,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio?.options.headers['token'] = '$token';
    var response = await dio!.get(
      '$baseUrl$endpoint',
      queryParameters: queryParameters,
    );
    return response.data;
  }

  static Future<Map<String, dynamic>> postData({
    required String endpoint,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio!.options.headers['Content-Type'] = 'application/json';
    if (token != null) {
      dio!.options.headers['token'] = token;
    }

    Response response = await dio!.post('$baseUrl$endpoint', data: data);

    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to post data. Status code: ${response.statusCode}');
    }
  }


  static Future<Map<String, dynamic>> deleteData({
    required String endpoint,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio!.options.headers['Content-Type'] = 'application/json';
    dio!.options.headers['Authorization'] = '$token';

    var response = await dio!.delete(
      '$baseUrl$endpoint',
      queryParameters: queryParameters,
    );

    if(response.statusCode == 404){
      showToast("", ToastState.ERROR);
    }

    return response.data;
  }

}



// static Future<Response> putData({
//   required String url,
//   Map<String, dynamic>? query,
//   required Map<String, dynamic> data,
//   String lang = 'en',
//   String? token,
// }) async {
//   dio!.options.headers = {
//     'Content-Type': 'application/json',
//     'lang': lang,
//     'Authorization': token,
//   };
//
//   return await dio!.put(url, queryParameters: query, data: data);
// }

//  Future<Map<String, dynamic>> post(
//     {required String endpoint, required dynamic data , String? bearerToken}) async {
//   _dio.options.headers['Accept'] = 'application/json';
//   _dio.options.headers['Authorization'] = 'Bearer $bearerToken';
//   var response = await _dio.post('$_baseUrl$endpoint', data: data);
//   return response.data;
//   }