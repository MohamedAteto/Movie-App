import 'package:flutter/material.dart';
import 'package:movie_app/models/move_model.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/providers/seets_provider.dart';
import 'package:provider/provider.dart';

class BookSeatPage extends StatelessWidget {
  final MoviModel movie;
  final SeetModle seat;

  BookSeatPage({super.key, required this.movie, required this.seat});

  final TextEditingController customerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var bookingProvider = context.read<BookingProvider>();

    var movieProvider = context.read<MovieProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Book Seat",
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

            const SizedBox(height: 40),

            const Text(
              "Enter Your Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: customerController,

              decoration: InputDecoration(
                hintText: "Full Name",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text("Cancel"),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await bookingProvider.createBookingProvider(
                        movieId: movie.id,
                        seatId: seat.seetId,
                        customerName: customerController.text,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Booking Created")),
                      );
                      await movieProvider.GetMoviesFromProvider();

                      Navigator.pop(context, true);
                    },

                    child: const Text("Confirm"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
