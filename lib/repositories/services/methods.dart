abstract class Methods {
  Future<dynamic> getAsync(
    String url, {
    String id,
    Map<String, dynamic>? queryParams,
    required Function callBack,
    required Function errorCallBack,
  });

  // Future<dynamic> postAsync(
  //   String url, {
  //   String id,
  //   Map<String, dynamic>? queryParams,
  //   required Map<String, dynamic> body,
  //   required Function callBack,
  //   required Function errorCallBack,
  // });
  //
  // Future<dynamic> putAsync(
  //   String url, {
  //   String id,
  //   Map<String, dynamic>? queryParams,
  //   required Map<String, dynamic> body,
  //   required Function callBack,
  //   required Function errorCallBack,
  // });
}
