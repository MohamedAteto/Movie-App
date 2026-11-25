import 'package:flutter/material.dart';
import 'package:movie_app/models/move_model.dart';
import 'package:movie_app/services/movei_services.dart';

class MovieProvider extends ChangeNotifier {
  MoviListModel? moviListModel;

  Future<void> GetMoviesFromProvider() async {
    moviListModel = await MoveiServices.getMovies();
    notifyListeners();
  }
}
