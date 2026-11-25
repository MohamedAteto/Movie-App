import 'package:dio/dio.dart';
import 'package:movie_app/models/move_model.dart';

class MoveiServices {
  static Dio dio = Dio();
  static Future<MoviListModel> getMovies() async {
    try {
      final Response response = await dio.get(
        "https://apimovie.runasp.net/api/Movies",
      );

      return MoviListModel.fromJson(response.data);
    } catch (e, stackTrace) {
      print("Real error: $e");
      print("Stack trace: $stackTrace");
      throw Exception("Failed to fetch data: $e");
    }
  }
}
