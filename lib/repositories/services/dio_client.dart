import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_fitness_coach/repositories/services/methods.dart';

import '../../utils/utils.dart';

class DioClient implements Methods {
  late Dio currentDio;
  DioClient(
      {required Dio dio,
      int? sendTimeout,
      int? receiveTimeout,
      CancelToken? cancelToken}) {
    currentDio = dio;
    sendTimeout = sendTimeout ?? 15000;
    receiveTimeout = receiveTimeout ?? 15000;
    currentDio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("onRequest: ${options.method} ${options.path}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        return handler.next(e);
      },
    ));
  }
  Map<String, dynamic> getHeader() {
    final Map<String, dynamic> header = <String, dynamic>{
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
      'X-RapidAPI-Key': '0edad437eamshd71382be794ad8dp1705b2jsn8eff29e6ad32',
      'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
    };
    return header;
  }

  @override
  Future<dynamic> getAsync(
    String url, {
    String id = '',
    Map<String, dynamic>? queryParams,
    required Function callBack,
    required Function errorCallBack,
  }) async {
    if (await Utils.checkInternetConnections()) {
      Response response;
      try {
        response = await currentDio.get<void>(
          url,
          queryParameters: queryParams,
          options: Options(
            headers: getHeader(),
            validateStatus: (status) {
              return status! <= 500;
            },
          ),
          onReceiveProgress: (int sent, int total) {
            // print('onReceiveProgress');
          },
        );
        // ignore: avoid_print
        print('onResponse: $response');
        if (!((response.statusCode! < HttpStatus.ok) ||
            (response.statusCode! >= HttpStatus.multipleChoices) ||
            (response.data == null))) {
          callBack(response);
        }
      } on DioError catch (e) {
        errorCallBack(e.toString());
      } on SocketException catch (e) {
        errorCallBack(e.toString());
      } catch (e) {
        errorCallBack(e.toString());
      }
    } else {
      errorCallBack(
          "Không thể kết nối với máy chủ, vui lòng kiểm tra kết nối internet của bạn và thử lại!");
    }
  }
}
