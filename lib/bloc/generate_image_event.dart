part of 'generate_image_bloc.dart';

@immutable
sealed class GenerateImageEvent {}

class GenerateInitialEvent extends GenerateImageEvent {}

class EnterTextEvent extends GenerateImageEvent {
  final String text;

  EnterTextEvent({required this.text});

}