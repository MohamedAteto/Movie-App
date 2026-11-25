import 'package:flutter/material.dart';
import 'package:movie_app/models/move_model.dart';
import 'package:movie_app/providers/seets_provider.dart';
import 'package:provider/provider.dart';

import '../providers/movie_provider.dart';

class BookingDetailsPage extends StatelessWidget {
  final MoviModel movie;
  final SeetModle seat;
  final TextEditingController controller;

  BookingDetailsPage({super.key, required this.movie, required this.seat})
    : controller = TextEditingController(text: seat.customerName ?? '');

  @override
  Widget build(BuildContext context) {
    var providerObject = context.read<BookingProvider>();
    var providerMovieObject = context.read<MovieProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Booking Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF123B63),
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),

                  child: Image.network(
                    movie.poster,
                    width: 120,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 20),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        movie.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Row(
                        children: [
                          const Icon(Icons.calendar_month),
                          const SizedBox(width: 5),
                          Text(movie.showDate),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Icon(Icons.access_time),
                          const SizedBox(width: 5),
                          Text(movie.showTime),
                        ],
                      ),

                      const SizedBox(height: 15),

                      Text(
                        "Seat: ${seat.seetNumber}",
                        style: const TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            const Text(
              "Booked By",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: "Customer Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),

            const Text(
              "This seat is already booked.",
              style: TextStyle(fontSize: 16),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,

              child: OutlinedButton.icon(
                onPressed: () async {
                  await providerObject.deleteBookingProvider(seat.bookingId!);

                  await providerMovieObject.GetMoviesFromProvider();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Booking Cancelled")),
                  );

                  Navigator.pop(context, true);
                },
                icon: const Icon(Icons.delete, color: Colors.red),
                label: const Text(
                  "Cancel Booking",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF123B63),
                ),
                onPressed: () async {
                  await providerObject.updateBookingProvider(
                    bookingId: seat.bookingId!,
                    customerName: controller.text,
                  );

                  await providerMovieObject.GetMoviesFromProvider();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Customer Name Updated Successfully"),
                    ),
                  );

                  Navigator.pop(context, true);
                },
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text(
                  "Update Name",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
