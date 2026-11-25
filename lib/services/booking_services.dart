import 'package:dio/dio.dart';

class BookingServices {
  static Dio dio = Dio();
  // In your API service:
  static Future<Response> addBooking({
    required int movieId,
    required int seetId,
    required String customerName,
  }) async {
    try {
      return await dio.post(
        "https://apimovie.runasp.net/api/Bookings",
        data: {
          "movieId": movieId,
          "seatId": seetId,
          "customerName": customerName,
        },
      );
    } on DioException catch (dioException) {
      final apiMessage = dioException.response?.data ?? dioException.message;
      throw Exception(
        "Dio Error (${dioException.response?.statusCode}): $apiMessage",
      );
    } catch (other) {
      throw Exception("Other Error: $other");
    }
  }

  static Future<void> updateBooking({
    required int bookingId,
    required String customerName,
  }) async {
    try {
      final Response response = await dio.put(
        "https://apimovie.runasp.net/api/Bookings/$bookingId",
        data: {"customerName": customerName},
      );
    } catch (ResponseError) {
      throw Exception(ResponseError.toString());
    }
  }

  static Future<void> DeleteBooking({required int bookingId}) async {
    try {
      final Response response = await dio.delete(
        "https://apimovie.runasp.net/api/Bookings/$bookingId",
      );
    } catch (ResponseError) {
      throw Exception(ResponseError.toString());
    }
  }
}
