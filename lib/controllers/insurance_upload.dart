import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hospital_app/model/data.dart';

class Update_Insurance{
  
 // creating a collection 
 static  void upload_image(String card_no, String imageurl, bool isVerified){
    try{
      if(card_no.isNotEmpty && imageurl.isNotEmpty){
        Data data= Data(cardno: card_no, imgurl: imageurl, isVerified: isVerified);
        FirebaseFirestore.instance.collection('insurance_company_data').doc().set(data.toJson()).then((value) {
          Get.snackbar('Image sent', 'Image sent for verification');
        });
      }
    }catch(e){
     Get.snackbar('Error',  e.toString());
    }
  }

}