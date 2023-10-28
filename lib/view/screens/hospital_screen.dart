import 'package:flutter/material.dart';
import 'package:hospital_app/controllers/auth.dart';

class HospitalScreen extends StatefulWidget {
  final String hospital_id;
  const HospitalScreen({required this.hospital_id, super.key});

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  TextEditingController _doctorController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromARGB(255, 254, 78, 89),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('Assets/images/doctor.png'),
                      fit: BoxFit.cover)),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only( left:30.0, right: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Enter your details',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: _doctorController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Doctor ID ',
                      labelStyle: TextStyle(fontSize: 21.0, color: Colors.white),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 32, 31, 31)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: _cvvController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter the CVV code',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 21.0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 32, 31, 31)),
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
                        Auth.instance.loginDoctor(widget.hospital_id,
                            _doctorController.text, _cvvController.text);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Color.fromARGB(255, 254, 78, 89),
                            fontSize: 20.0),
                      )),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
