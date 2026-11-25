import 'package:movie_app/widges/movie_item_componant.dart';

class MoviModel {
  final int id;
  final String name;
  final String poster;
  final String showDate;
  final String showTime;
  final List<SeetModle> seets;

  new({
    required this.id,
    required this.name,
    required this.poster,
    required this.showDate,
    required this.showTime,
    required this.seets,
  });
}

class SeetModle {
  final int seetId;
  final int? bookingId;
  final String seetNumber;
  final String status;
  final String? customerName;

  new({
    required this.seetId,
    required this.bookingId,
    required this.seetNumber,
    required this.status,
    required this.customerName,
  });
}

class MoviListModel {
  final bool status;
  final String message;

  final List<MoviModel> moviListData;

  new({
    required this.status,
    required this.message,
    required this.moviListData,
  });

  factory MoviListModel.fromJson(Map<String, dynamic> json) {
    final temp = json["data"]
        .map<MoviModel>(
          (value) => MoviModel(
            id: value['id'] ?? 0,
            name: value['name'] ?? '',
            poster: value['poster'] ?? '',
            showDate: value['showDate'] ?? '',
            showTime: value['showTime'] ?? '',
            seets: value['seats']
                .map<SeetModle>(
                  (s) => SeetModle(
                    seetId: s['seatId'] ?? 0,
                    bookingId: s['bookingId'] ?? 0,
                    seetNumber: s['seatNumber'] ?? '',
                    status: s['status'] ?? '',
                    customerName: s['customerName'] ?? '',
                  ),
                )
                .toList(),
          ),
        )
        .toList();

    return MoviListModel(
      status: json['status'],
      message: json['message'],
      moviListData: temp,
    );
  }
}
