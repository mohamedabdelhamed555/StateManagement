part of 'button_cubit.dart';

@immutable
sealed class ButtonState {}

final class ButtonInitial extends ButtonState {}

class ButtonIdleState extends ButtonState {}

class ButtonPressedState extends ButtonState {}
