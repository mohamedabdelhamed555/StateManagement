import 'package:bloc/bloc.dart';

import 'state.dart';

class ReplaceUiCubit extends Cubit<ReplaceUiState> {
  ReplaceUiCubit() : super(ReplaceUiInitState());

  void showText() {
    emit(ShowText());
  }

  void showCubitImage() {
    emit(ShowCubitImage());
  }

  void showBlueColor() {
    emit(ShowBlueColor());
  }

  void reset() {
    emit(ReplaceUiInitState());
  }
}
