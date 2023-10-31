import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientDetails {
  // fetch patient's data
  static Stream<QuerySnapshot> fetchdata(String cardno, String cvv) {
    return FirebaseFirestore.instance
        .collection('patient_details')
        .where('card_no', isEqualTo: cardno)
        .where('cvv', isEqualTo: cvv)
        .snapshots();
  }

  // update data
  static void  update_details(String card_no, String imagepath) async{
    CollectionReference reference = FirebaseFirestore.instance.collection('patient_details');
    // get the data of all where the condition is being satisfied
    QuerySnapshot snapshot = await reference.where('card_no', isEqualTo: card_no).get();
    if(snapshot.docs.isNotEmpty) {
        DocumentReference ref = snapshot.docs[0].reference;
        await ref.update({'prescription' :  FieldValue.arrayUnion([imagepath])}).then((value) {
          Get.snackbar('Updated', 'Successfully updated');
        });
    } 
    else {
      log('Document Empty');
    }
  }
  }
