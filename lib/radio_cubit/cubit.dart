import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedRadioCubit extends Cubit<int?> {
  SelectedRadioCubit() : super(null);

  void setSelectedRadioValue(int value) {
    emit(value);
  }
}
