import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitial());

  void toggleButton() {
    if (state is ButtonIdleState) {
      emit(ButtonPressedState());
    } else if (state is ButtonPressedState) {
      emit(ButtonIdleState());
    }
  }
}
