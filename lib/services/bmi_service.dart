import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/track_records.dart';

class Bmiprovider extends StateNotifier<List<TrackRecord>> {
  Bmiprovider() : super([]);

  Future<void> loadRecords() async {
    final userCredential = FirebaseAuth.instance.currentUser!;
    final trackRecordsQuery = await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.uid)
        .collection('trackRecords')
        .orderBy('timestamp', descending: true)
        .get();
    if (trackRecordsQuery.docs.isNotEmpty) {
      final trackRecords = trackRecordsQuery.docs.map((doc) {
        return TrackRecord.fromDocument(doc);
      }).toList();
      state = trackRecords;
    } else {
      state = [];
    }
  }

  void addRecord(double height, double weight) async {
    DateTime timestamp = DateTime.now();
    double bmi = weight / ((height) / 100 * (height) / 100);
    bmi = double.parse(bmi.toStringAsFixed(2));
    String result;
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentReference userRef =
        FirebaseFirestore.instance.collection('users').doc(userId);

    CollectionReference recordsRef = userRef.collection('trackRecords');
    await recordsRef.add({
      'weight': weight,
      'height': height,
      'bmi': bmi,
      'timestamp': timestamp,
    });
    if (bmi >= 25) {
      result = 'You are Overweight, consider exercising more!';
    } else if (bmi > 18.5) {
      result = 'You have a normal body weight, Good job!';
    } else {
      result = 'You are underweight, consider eating more!';
    }
    state = [
      TrackRecord(
          height: height,
          weight: weight,
          bmi: bmi,
          timestamp: timestamp,
          result: result),
      ...state
    ];
  }

  void clear() {
    state = [];
  }
}

// Provider untuk Bmiprovider
final bmiprovider =
    StateNotifierProvider<Bmiprovider, List<TrackRecord>>((ref) {
  return Bmiprovider();
});
