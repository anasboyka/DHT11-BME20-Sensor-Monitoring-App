import 'package:cloud_firestore/cloud_firestore.dart';

class Weather {
  final double temperature;
  final double humidity;
  final double pressure;
  final String? placeName;
  final DocumentSnapshot? snapshot;
  final DocumentReference? reference;
  final String? documentID;

  Weather({
    required this.temperature,
    required this.humidity,
    required this.pressure,
    this.placeName,
    this.snapshot,
    this.reference,
    this.documentID,
  });

  factory Weather.fromFirestore(DocumentSnapshot snapshot) {
    dynamic map = snapshot.data();

    return Weather(
      temperature: map['temperature'].toDouble(),
      humidity: map['humidity'].toDouble(),
      pressure: map['pressure'].toDouble(),
      placeName: map['placeName'] ?? '',
      snapshot: snapshot,
      reference: snapshot.reference,
      documentID: snapshot.id,
    );
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
        temperature: map['temperature'],
        humidity: map['humidity'],
        pressure: map['pressure'],
        placeName: map['placeName']);
  }

  Map<String, dynamic> toMap() => {
        'temperature': temperature,
        'humidity': humidity,
        'pressure': pressure,
        'placeName': placeName,
      };

  Weather copyWith({
    double? temperature,
    double? humidity,
    double? pressure,
    String? placeName,
  }) {
    return Weather(
      temperature: temperature ?? this.temperature,
      humidity: humidity ?? this.humidity,
      pressure: pressure ?? this.pressure,
      placeName: placeName ?? this.placeName,
    );
  }

  @override
  String toString() {
    return '${temperature.toString()}, ${humidity.toString()}, ${pressure.toString()} ';
  }

  @override
  bool operator ==(other) => other is Weather && documentID == other.documentID;

  int get hashCode => documentID.hashCode;
}
