import 'package:flutter/material.dart';
import 'package:movie_app/models/move_model.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/screens/book_seat_page.dart';
import 'package:movie_app/screens/booking_details.dart';
import 'package:movie_app/widges/movie_item_componant.dart';
import 'package:movie_app/widges/seet_item.dart';
import 'package:provider/provider.dart';

class MovieSeats extends StatelessWidget {
  MoviModel moviModel;
  MovieSeats({required this.moviModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(moviModel.name), centerTitle: true),

      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            MovieItemComponant(moviModel: moviModel),
            SizedBox(height: 5),

            Text(
              "Select your seat",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: .bold,
              ),
            ),

            Consumer<MovieProvider>(
              builder: (context, value, child) {
                final moviesList = value.moviListModel;

                if (moviesList == null) {
                  value.GetMoviesFromProvider();
                  return Center(child: CircularProgressIndicator());
                }
                final currentmovies = moviesList.moviListData.firstWhere(
                  (item) => item.id == moviModel.id,
                );

                final seats = currentmovies.seets;

                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      childAspectRatio: 1.4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: seats.length,
                    itemBuilder: (context, index) {
                      final seet = seats[index];
                      return SeetItem(
                        seatNumber: seet.seetNumber,
                        status: seet.status,
                        onTap: () {
                          if (seet.status == "Available") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookSeatPage(
                                  movie: currentmovies,
                                  seat: seet,
                                ),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingDetailsPage(
                                  movie: currentmovies,
                                  seat: seet,
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
