import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';

class GenarateImageRepository {
  static Future<Uint8List?> ImageGenerate(String text) async {
    try {
      String Url = "https://api.vyro.ai/v1/imagine/api/generations";

      Map<String, dynamic> header = {
        'Authorization':
            'Bearer ',
      };

      Map<String, dynamic> payload = {
        'prompt': text,
        'style_id': '122',
        'aspect_ratio': '1:1',
        'cfg': '10',
        'seed': '1',
        'high_res_results': '1',
      };

      Dio dio = Dio();
      dio.options = BaseOptions(
        headers: header,
        responseType: ResponseType.bytes,
      );

      FormData formData = FormData.fromMap(payload);
      final response = await dio.post(Url, data: formData,);
      if (response.statusCode == 200) {
        log(response.data.runtimeType.toString());
        log(response.data.toString());
        Uint8List uint8List = Uint8List.fromList(response.data);
        return uint8List;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
