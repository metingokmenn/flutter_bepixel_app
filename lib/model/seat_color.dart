import 'dart:convert';

class SeatColor {
  String seatId;
  List<int> colorSequence;

  SeatColor({
    required this.seatId,
    required this.colorSequence,
  });

  factory SeatColor.fromJson(String str) => SeatColor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SeatColor.fromMap(Map<String, dynamic> json) => SeatColor(
        seatId: json["seat_id"],
        colorSequence: List<int>.from(json["colorSequence"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "seat_id": seatId,
        "colorSequence": List<dynamic>.from(colorSequence.map((x) => x)),
      };
}
