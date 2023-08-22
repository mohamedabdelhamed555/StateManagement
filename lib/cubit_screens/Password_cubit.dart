import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/visible/cubit.dart';

class TextFormFieldByCubit extends StatelessWidget {
  const TextFormFieldByCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordVisibilityCubit(),
      child: Scaffold(
        body: TextFormFieldByCubitt(),
      ),
    );
  }
}

class TextFormFieldByCubitt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              obscureText: context
                  .select((PasswordVisibilityCubit cubit) => cubit.state),
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: GestureDetector(
                  onTap: () {
                    context.read<PasswordVisibilityCubit>().toggleVisibility();
                  },
                  child: BlocBuilder<PasswordVisibilityCubit, bool>(
                    builder: (context, state) {
                      return Icon(
                        state ? Icons.visibility_off : Icons.visibility,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
