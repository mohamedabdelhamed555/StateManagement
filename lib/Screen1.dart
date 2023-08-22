import 'package:flutter/material.dart';
import 'package:state_managment/ButtonCubit.dart';
import 'package:state_managment/Radio.dart';
import 'package:state_managment/cubit_screens/Password_cubit.dart';

class screen1 extends StatefulWidget {
  @override
  _screen1State createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  int? selectedButtonIndex;
  bool _isObscured = true;
  List filterBar = [
    "قيد التنفيذ",
    "الملغية",
    "المكتملة",
    "تحت المراجعه",
    "تمت",
    "rhdyh",
  ];
  bool _isButtonPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < filterBar.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: TextButton(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.blue; // Color when pressed
                              }
                              return Colors.grey; // Default color
                            },
                          ),
                        ),
                        onPressed: () {
                          setState() {
                            _isButtonPressed = !_isButtonPressed;
                          }
                        },
                        child: Text(
                          "${filterBar[i]}",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextFormField(
              obscureText: _isObscured, // تحديد إظهار أو إخفاء النص
              decoration: InputDecoration(
                hintText: "password",
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscured = !_isObscured; // تبديل حالة إخفاء النص
                    });
                  },
                  child: Icon(
                    _isObscured ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => buttonCubit()),
              );
            },
            child: const Text(
              'cubit filterBar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TextFormFieldByCubit()),
                );
              },
              child: const Text(
                'cubit Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.red,
                ),
              )),
          SizedBox(
            height: 25,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Screen2()),
              );
            },
            child: const Text(
              'screen 2',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
