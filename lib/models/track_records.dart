import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TrackRecord {
  final double bmi;
  final double height;
  final double weight;
  final DateTime timestamp;
  final String result;

  TrackRecord({
    required this.bmi,
    required this.height,
    required this.weight,
    required this.timestamp,
    this.result = '',
  });

  // Factory method to create a TrackRecord from a Firestore document
  factory TrackRecord.fromDocument(DocumentSnapshot doc) {
    return TrackRecord(
      bmi: doc['bmi'],
      height: doc['height'],
      weight: doc['weight'],
      timestamp: (doc['timestamp'] as Timestamp).toDate(),
    );
  }

  static Stream<List<TrackRecord>> getTrackRecords() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      // Handle the case where there is no user logged in
      return Stream.value([]);
    }

    return FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .collection('trackRecords')
        .orderBy('timestamp')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return TrackRecord.fromDocument(doc);
      }).toList();
    });
  }
}
