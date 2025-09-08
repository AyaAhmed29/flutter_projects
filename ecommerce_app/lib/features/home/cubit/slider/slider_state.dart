part of 'slider_cubit.dart';

@immutable
sealed class SliderState {}

final class SliderInitial extends SliderState {}

final class SliderLoading extends SliderState {}

final class SliderSuccess extends SliderState {
  final SliderModel sliders;

  SliderSuccess({required this.sliders});
}

final class Sliderfailure extends SliderState {
  final String error;

  Sliderfailure({required this.error});
}
final class ChangeCurrentIndex extends SliderState {
  


}