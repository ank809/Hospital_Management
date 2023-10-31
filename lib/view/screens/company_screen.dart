import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_app/controllers/insurance_upload.dart';
import 'package:hospital_app/controllers/patient_details.dart';
import 'package:hospital_app/view/screens/upload_detail.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.red,
        child: StreamBuilder<QuerySnapshot>(
          stream: Update_Insurance.getdata(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No data found',
                    style: TextStyle(color: Colors.white)),
              );
            }
            if (snapshot.hasError) {
              return Center(
                  child: Text('Error: ${snapshot.error}',
                      style: TextStyle(color: Colors.white)));
            }
            List<DocumentSnapshot> document = snapshot.data!.docs;
            return ListView.builder(
                itemCount: document.length, itemBuilder: (context, index) {
                   final item = document[index].data() as Map<String, dynamic>;
                   return Card(
                    child: Column(
                      children: [
                        Row(children: [
                          const Text('Patient\'s Card no:'),
                          Text(item['card_no']),
                        ],),
                        Container(
                          child: Image.network(item['imageURL'],
                          fit: BoxFit.contain,),
                        ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text('Decline')),
                              ElevatedButton(onPressed: (){
                                Update_Insurance.update_data(item['card_no']);
                                PatientDetails.update_details(item['card_no'], item['imageURL']);
                                Update_Insurance.deletedata(document[index].id);

                              }, child: Text('Accept'))
                            ],
                          ),

                      ],
                    ),
                   );
                });
          },
        ),
      ),
    );
  }
}
