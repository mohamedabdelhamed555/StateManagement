import 'package:flutter/material.dart';
import 'package:state_managment/cubit_screens/cubit/button_cubit.dart';

// ignore: must_be_immutable
class buttonCubit extends StatelessWidget {
  buttonCubit({super.key});

  List filterBar = [
    "قيد التنفيذ",
    "الملغية",
    "المكتملة",
    "تحت المراجعه",
    "تمت",
    "rhdyh",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Scaffold(
        body: ListView(
          children: [
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
                                  return Colors.blue;
                                }
                                return Colors.grey;
                              },
                            ),
                          ),
                          onPressed: () {
                            ButtonCubit().toggleButton();
                            ;
                          },
                          child: Text(
                            "${filterBar[i]}",
                            style: TextStyle(color: Colors.black),
                          )),
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
