import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_app/controllers/patient_details.dart';
import 'package:hospital_app/view/screens/upload_detail.dart';

class HomePage extends StatefulWidget {
  final String cardno;
  final String cvv;
  const HomePage({ required this.cardno, required this.cvv,    super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<QuerySnapshot>(
          stream: PatientDetails.fetchdata(widget.cardno, widget.cvv),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No data found', style: TextStyle(color: Colors.white)),
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)));
            }
            List<DocumentSnapshot> document = snapshot.data!.docs;
            return ListView.builder(
              itemCount: document.length,
              itemBuilder: (context, index) {
                final item = document[index].data() as Map<String, dynamic>;
                return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  margin: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Your Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      buildDetailRow(Icons.person, 'NAME', item['name']),
                      const SizedBox(height: 20.0),
                      buildDetailRow(Icons.calendar_month, 'AGE', item['age']),
                      const SizedBox(height: 20.0),
                      buildDetailRow(Icons.favorite, 'BLOOD GROUP', item['blood_group']),
                      const SizedBox(height: 20.0),
                      buildDetailRow(Icons.person, 'Gender', item['gender']),
                      const SizedBox(height: 20.0),
                      buildDetailRow(Icons.person, 'Address', item['address']),
                      const SizedBox(height: 20.0),
                      Container(
                      child: item['prescription'] == "none" ? Text('No prescription') : Image.network(item['prescription']),
                      ), 
                    ],
                  ),
                );
              },
            );
          },
        )
      ),
      floatingActionButton: Container(
        height
        : 50,
        width: 160,
        child: FloatingActionButton.extended(
          backgroundColor: Colors.grey,
          onPressed: () {
            Get.to(UploadDetails(cardno: widget.cardno));
          }, label: const Row(
          children: [
            Icon(Icons.upload_file, size: 30,
            color: Colors.black,),
            Text('Upload', style: TextStyle(
              fontSize: 22.0,
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),),
      ),
    );
  }
   Widget buildDetailRow(IconData icon, String label, String value) {
    return Row(
      children: [
       Icon(icon, color: Colors.pink),
        const SizedBox(width: 10.0),
        Text('$label: ', style: const TextStyle(color: Colors.pink, fontSize: 18.0, fontWeight: FontWeight.bold)),
         Flexible(
          child: Text(
            value,
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
      ],
    );
  }
}