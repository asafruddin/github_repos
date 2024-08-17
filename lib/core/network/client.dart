import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkClient {
  Dio get dio {
    final option = BaseOptions(
      baseUrl: 'https://api.github.com',
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 30000),
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/vnd.github+json',
        'Authorization': 'Bearer token'
      },
    );

    final dio = Dio(option);

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: false,
    ));

    return dio;
  }
}
