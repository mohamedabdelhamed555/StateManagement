import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_managment/cubit_screens/SectionScreenCubit.dart';

import 'package:state_managment/section/cubit.dart';
import 'package:state_managment/section/state.dart';

class ReplaceUiScreen extends StatefulWidget {
  ReplaceUiScreen({Key? key}) : super(key: key);

  @override
  _ReplaceUiScreenState createState() => _ReplaceUiScreenState();
}

class _ReplaceUiScreenState extends State<ReplaceUiScreen> {
  late ReplaceUiCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = ReplaceUiCubit();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SectionScreen(
        cubit: _cubit,
      ),
    );
  }
}

class SectionScreen extends StatelessWidget {
  final ReplaceUiCubit cubit;

  const SectionScreen({required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          BlocBuilder<ReplaceUiCubit, ReplaceUiState>(
            bloc: cubit,
            builder: (BuildContext context, state) {
              if (state is ShowText) {
                return const Text(
                  'welcome to my cubit example',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 24,
                  ),
                );
              } else if (state is ShowCubitImage) {
                return Image.network(
                  "https://scontent.fcai20-5.fna.fbcdn.net/v/t1.6435-9/80591970_2606048892958317_2308262991356755968_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=iQcMADTJd1kAX8fUMM5&_nc_ht=scontent.fcai20-5.fna&oh=00_AfC2NTetuEok4veJlTBnYuePR-cbTbsmmh_nM2sOfhXclw&oe=650C618B",
                  height: 180,
                );
              } else if (state is ShowBlueColor) {
                return Container(
                  color: Colors.orange,
                  height: 100,
                  width: 100,
                );
              } else {
                return Container();
              }
            },
          ),
          SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: () {
              cubit.showText();
            },
            child: const Text('text'),
          ),
          SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: () {
              cubit.showBlueColor();
            },
            child: const Text('container'),
          ),
          SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: () {
              cubit.showCubitImage();
            },
            child: const Text('picture'),
          ),
          SizedBox(
            height: 60,
          ),
          ElevatedButton(
            onPressed: () {
              cubit.reset();
            },
            child: const Text('reset'),
          ),
          SizedBox(
            height: 60,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => sectionScreenCubit()),
              );
            },
            child: const Text('By cubit'),
          ),
        ],
      ),
    );
  }
}
