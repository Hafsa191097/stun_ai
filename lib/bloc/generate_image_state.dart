part of 'generate_image_bloc.dart';

@immutable
sealed class GenerateImageState {}

final class GenerateImageInitial extends GenerateImageState {}

final class LoadingState extends GenerateImageState {}

final class SuccessState extends GenerateImageState {
  final Uint8List file;

  SuccessState({required this.file});
}

final class ErrorState extends GenerateImageState {}