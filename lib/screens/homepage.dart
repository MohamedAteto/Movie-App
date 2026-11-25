import 'package:flutter/material.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/widges/movie_item_componant.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movies",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),

      body: Consumer<MovieProvider>(
        builder: (context, value, child) {
          final List = value.moviListModel?.moviListData;
          if (List == null) {
            value.GetMoviesFromProvider();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: List.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),

              itemBuilder: (context, index) {
                final opject = List[index];
                return MovieItemComponant(moviModel: opject);
              },
            );
          }
        },
      ),
    );
  }
}
