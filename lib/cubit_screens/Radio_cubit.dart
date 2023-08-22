import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/radio_cubit/cubit.dart';

class RadioButtomByCubit extends StatelessWidget {
  const RadioButtomByCubit({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectedRadioCubit(),
      child: Scaffold(
        body: RadioButtomByCubitt(),
      ),
    );
  }
}

class RadioButtomByCubitt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectedRadioCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: ListView.builder(
              padding: EdgeInsets.all(20.0),
              itemCount: 20,
              itemBuilder: (context, index) {
                return BlocBuilder<SelectedRadioCubit, int?>(
                  builder: (context, state) {
                    return RadioListTile(
                      title: Text(
                        'choice ${index + 1}',
                        style: TextStyle(color: Colors.red),
                      ),
                      value: index,
                      groupValue: state,
                      onChanged: (value) {
                        context
                            .read<SelectedRadioCubit>()
                            .setSelectedRadioValue(value as int);
                      },
                      activeColor: Colors.blue,
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
