import 'package:flutter/material.dart';
import 'package:movie_app/screens/movie_seats.dart';

class MovieItemComponant extends StatelessWidget {
  final String name;
  final String showDate;
  final String showTime;
  final String imageUrl;

  MovieItemComponant({
    super.key,
    required this.name,
    required this.showDate,
    required this.showTime,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieSeats(
              name: name,
              showDate: showDate,
              showTime: showTime,
              imageUrl: imageUrl,
            ),
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
                  imageUrl,
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
                      name,
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
                          TextSpan(text: showDate),
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

                          TextSpan(text: showTime),
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
