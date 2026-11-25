import 'package:flutter/material.dart';
import 'package:movie_app/models/move_model.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/widges/movie_item_componant.dart';
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
            MovieItemComponant(
              name: moviModel.name,
              showDate: moviModel.showDate,
              showTime: moviModel.showTime,
              imageUrl: moviModel.poster,
            ),
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
                  return const Center(child: CircularProgressIndicator());
                }
                final currentmovies = moviesList.moviListData.firstWhere(
                  (item) => item.id == moviModel.id,
                );

                final seats = currentmovies.seets;

                Expanded(
                  child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Card(
                  
                )
              },
            ),
               )
              },
            ),
          ],
        ),
      ),
    );
  }
}
