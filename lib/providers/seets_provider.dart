import 'package:flutter/material.dart';
import 'package:movie_app/services/booking_services.dart';

class BookingProvider extends ChangeNotifier {
  Future<void> createBookingProvider({
    required int movieId,
    required int seatId,
    required String customerName,
  }) async {
    await BookingServices.addBooking(
      movieId: movieId,
      seetId: seatId,
      customerName: customerName,
    );

    notifyListeners();
  }

  Future<void> updateBookingProvider({
    required int bookingId,
    required String customerName,
  }) async {
    await BookingServices.updateBooking(
      bookingId: bookingId,
      customerName: customerName,
    );

    notifyListeners();
  }

  Future<void> deleteBookingProvider(int bookingId) async {
    await BookingServices.DeleteBooking(bookingId: bookingId);
    notifyListeners();
  }
}
