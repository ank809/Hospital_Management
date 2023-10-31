import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_app/view/screens/home.dart';

class SearchPatient extends StatefulWidget {
  const SearchPatient({super.key});

  @override
  State<SearchPatient> createState() => _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {
  TextEditingController _cardController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 254, 78, 89),
        child: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Search Patient',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                controller: _cardController,
                decoration: const InputDecoration(
                  labelText: 'Enter Patient\'s card number',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18.0),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextFormField(
                obscureText: true,
                controller: _cvvController,
                //keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter Patient\'s CVV code ',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 18.0),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    Get.to(HomePage(
                        cardno: _cardController.text,
                        cvv: _cvvController.text,
                        isPatient: false,));
                  },
                  child: const Text(
                    'Search',
                    style: TextStyle(
                        color: Color.fromARGB(255, 254, 78, 89),
                        fontSize: 20.0),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
