import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

// 或者通过传递一个 `options`来创建dio实例
BaseOptions options = BaseOptions(
    baseUrl: "http://39.105.167.167",
    connectTimeout: 5000,
    receiveTimeout: 3000,
    responseType: ResponseType.json);

Dio dio = Dio(options);

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print("REQUEST[${options?.method}] => PATH: ${options?.path}");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(
        "RESPONSE[${response?.statusCode}] => PATH: ${response?.request?.path}");
    if (response.data['code'] != 0) {
      BotToast.showText(text: "请求失败！code: ${response.data['code']}");
    }
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print(
        "ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path} => VALUE: ${err?.toString()}");
    return super.onError(err);
  }
}

class ApiPath {
  String topicList = "/x/topic/list";
}
