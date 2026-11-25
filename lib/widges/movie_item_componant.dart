import 'package:flutter/material.dart';
import 'package:movie_app/models/move_model.dart';
import 'package:movie_app/screens/movie_seats.dart';

class MovieItemComponant extends StatelessWidget {
  final MoviModel moviModel;

  MovieItemComponant({required this.moviModel, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieSeats(moviModel: moviModel),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  moviModel.poster,
                  width: 70,
                  height: 95,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      moviModel.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text.rich(
                      TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(Icons.calendar_today),
                            alignment: PlaceholderAlignment.middle,
                          ),
                          const TextSpan(text: ' '),
                          TextSpan(text: moviModel.showDate),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text.rich(
                      TextSpan(
                        children: [
                          const WidgetSpan(
                            child: Icon(Icons.av_timer_rounded),
                            alignment: PlaceholderAlignment.middle,
                          ),

                          const TextSpan(text: ' '),

                          TextSpan(text: moviModel.showTime),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
