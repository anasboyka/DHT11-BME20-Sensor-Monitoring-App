import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weather_app/data/models/weather.dart';

class FirestoreDb {
  final String? uid;
  FirestoreDb({this.uid});

  final CollectionReference weatherCollection =
      FirebaseFirestore.instance.collection('weather');

  Stream<Weather?> get weather {
    return weatherCollection.doc('current').snapshots().map(
          (doc) => Weather.fromFirestore(doc),
        );
  }

  Future registerPlace(String placeName) async {
    return weatherCollection.doc('current').update({
      "placeName": placeName,
    });
  }
}
