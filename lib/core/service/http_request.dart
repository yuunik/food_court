import 'package:dio/dio.dart';

import 'package:food_court/core/service/http_config.dart';

/// dio 配置类
class HttpRequest {
  static final BaseOptions _baseOptions = BaseOptions(
    baseUrl: HttpConfig.baseUrl,
    connectTimeout: const Duration(seconds: HttpConfig.connectTimeout),
    receiveTimeout: const Duration(seconds: HttpConfig.receiveTimeout)
  );

  static final Dio _dio = Dio(_baseOptions);

  static Future<T> send<T>(String url, {String method = "get", Map<String, dynamic>? queryParams, Interceptor? interceptor}) async {
    // 配置单独的配置
    final options = Options(method: method);

    try {
      // 全局默认拦截器
      Interceptor globalInterceptor = InterceptorsWrapper(
        onRequest: (options, handler) {
          print("请求拦截器");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("响应拦截器");
          return handler.next(response);
        },
        onError: (error, handler) {
          print("错误拦截器");
          return handler.next(error);
        }
      );
      // 自定义拦截器
      List<Interceptor> interceptorList = [globalInterceptor];
      if (interceptor != null) {
        interceptorList.add(interceptor);
      }
      _dio.interceptors.addAll(interceptorList);
      // 发送请求
      final response = await _dio.request(
          url,
          queryParameters: queryParams,
          options: options
      );
      return response.data;
    } on DioException catch (e) {
      return Future.error(e);
    }
  }
}