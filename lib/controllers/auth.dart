import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hospital_app/view/screens/company_screen.dart';
import 'package:hospital_app/view/screens/home.dart';
import 'package:hospital_app/view/screens/hospital_screen.dart';
import 'package:hospital_app/view/screens/patient.dart';
import 'package:hospital_app/view/screens/search_patient.dart';

class Auth extends GetxController{
  static Auth instance= Get.find();

  void loginPatient(String cardno, String cvv){
    CollectionReference collectionReference= FirebaseFirestore.instance.collection('patients');
    collectionReference.where('card_no', isEqualTo: cardno).where('cvv', isEqualTo: cvv).get().then((QuerySnapshot snapshot) {
      if(snapshot.docs.isNotEmpty){
        Get.snackbar('Succesfully Logged in', '');
        // Get.offAll(PatientScreen());
        Get.offAll(HomePage(cardno: cardno, cvv: cvv, isPatient: true,));
      }
      else{
        Get.snackbar('Incorrect details', '');
      }
    });
  }
  void loginHospital(String hospitalId, String cvv){
    CollectionReference collectionReference= FirebaseFirestore.instance.collection('hospitals');
    collectionReference.where('hospital_id', isEqualTo: hospitalId).where('cvv', isEqualTo: cvv).get().then((QuerySnapshot snapshot) {
      if(snapshot.docs.isNotEmpty){
        Get.snackbar('Successfully Logged in', '');
        Get.offAll(HospitalScreen(hospital_id: hospitalId));
      }
      else{
        Get.snackbar('Incorrect details', '');
      }
    });
  }
  void loginDoctor(String hospitalId, String doctorId,String cvv){
    CollectionReference collectionReference= FirebaseFirestore.instance.collection('doctors');
    collectionReference.where('hospital_id', isEqualTo: hospitalId). where('doctor_id', isEqualTo: doctorId).where('cvv', isEqualTo: cvv).get().then((QuerySnapshot snapshot) {
      if(snapshot.docs.isNotEmpty){
        Get.snackbar('Successfully Logged in', '');
        Get.offAll(SearchPatient());
     }
      else{
        Get.snackbar('Incorrect details', '');
      }
    });
  }
  void loginInsuranceCompany(String companyId, String cvv){
    CollectionReference collectionReference= FirebaseFirestore.instance.collection('insurance_company');
    collectionReference.where('insurance_company_id', isEqualTo: companyId).where('cvv', isEqualTo: cvv).get().then((QuerySnapshot snapshot) {
      if(snapshot.docs.isNotEmpty){
        Get.snackbar('Successfully Logged in', '');
        Get.offAll(const CompanyScreen());
      }
      else{
        Get.snackbar('Incorrect details', '');
      }
    });
  }
}