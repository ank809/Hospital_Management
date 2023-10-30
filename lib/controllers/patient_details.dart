import 'package:cloud_firestore/cloud_firestore.dart';

class PatientDetails {
  // fetch patient's data
  static Stream<QuerySnapshot> fetchdata(String cardno, String cvv) {
    return FirebaseFirestore.instance
        .collection('patient_details')
        .where('card_no', isEqualTo: cardno)
        .where('cvv', isEqualTo: cvv)
        .snapshots();
  }
}
