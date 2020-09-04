import 'dart:io';

import 'package:dio/dio.dart';

import 'dio_util.dart';

Future<FormData> formData(File file) async {
  return FormData.fromMap({
    "file": await MultipartFile.fromFile(
      file.path,
      filename: "image.jpg",
    ),
  });
}

Future<Response> upLoad(
  String path, {
  ProgressCallback onSendProgress,
  File file,
}) async {
  return DioUtil.getDio()
      .post(path, data: await formData(file), onSendProgress: onSendProgress);
}
