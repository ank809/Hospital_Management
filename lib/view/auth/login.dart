import 'package:flutter/material.dart';
import 'package:hospital_app/controllers/auth.dart';
//import 'package:hospital_management/controllers/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String whoisLogin =
      'patient'; // Track whether the user is a patient or hospital
  TextEditingController _cvvController = TextEditingController();
  TextEditingController _hospitalController = TextEditingController();
  TextEditingController _patientController = TextEditingController();
  TextEditingController _insurance_companyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 254, 78, 89),
        child: ListView(
          padding: const EdgeInsets.all(13.0),
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Assets/images/hospital2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 25.0, bottom: 20.0),
              child: const Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              //padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            whoisLogin = 'patient';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: whoisLogin=='patient'? Colors.grey: Colors.white
                        ),
                        child: const Text(
                          'Patient',
                          style: TextStyle(
                              color: Color.fromARGB(255, 254, 78, 89)),
                        ),
                      ),
                      SizedBox(width: 3.5,),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            whoisLogin = 'hospital';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: whoisLogin=='hospital'? Colors.grey: Colors.white),
                        child: const Text(
                          'Hospital',
                          style: TextStyle(
                              color: Color.fromARGB(255, 254, 78, 89)),
                        ),
                      ),
                      SizedBox(width: 3.5,),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            whoisLogin = 'insurance_company';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                             backgroundColor: whoisLogin=='insurance_company'? Colors.grey: Colors.white),
                        child: const Text(
                          'Insurance Company',
                          style: TextStyle(
                              color: Color.fromARGB(255, 254, 78, 89)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),
                  TextFormField(
                    controller: (whoisLogin == 'patient')
                        ? _patientController
                        : (whoisLogin == 'hospital')
                            ? _hospitalController
                            : _insurance_companyController,
                    // keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: (whoisLogin =='patient')? 'Card Number':(whoisLogin=='hospital')?'Hospital Id':'Insurance Company Id',
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      border: const UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  TextFormField(
                    controller: _cvvController,
                    //keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter the CVV code',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (whoisLogin=='patient') {
                          Auth.instance.loginPatient(_patientController.text, _cvvController.text);
                        } else if (whoisLogin=='hospital'){
                           Auth.instance.loginHospital(_hospitalController.text, _cvvController.text);
                        }
                        else{
                           Auth.instance.loginInsuranceCompany(_insurance_companyController.text, _cvvController.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Color.fromARGB(255, 254, 78, 89),
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
