import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

class GenarateImageRepository {
  static Future<List<int>?> ImageGenerate(String text) async {
    try {
      String Url = "https://api.vyro.ai/v1/imagine/api/generations";

      Map<String, dynamic> header = {
        'Authorization':
            'Bearer vk-idWEpD8fpmqDBuWJZnr3ZgokPoY3EEloQl56M2zlLwyIEe',
      };

      Map<String, dynamic> payload = {
        'prompt': text,
        'style_id': '122',
        'aspect_ratio': '1:1',
        'cfg': '1',
        'seed': '1',
        'high_res_results': '1',
      };

      Dio dio = Dio();
      dio.options = BaseOptions(
        headers: header,
      );

      FormData formData = FormData.fromMap(payload);
      final response = await dio.post(Url, data: formData);
      if (response.statusCode == 200) {
        String bytes = response.data.toString();
        return bytes.codeUnits;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
