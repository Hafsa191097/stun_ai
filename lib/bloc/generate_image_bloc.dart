import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../Repos/repository.dart';

part 'generate_image_event.dart';
part 'generate_image_state.dart';

class GenerateImageBloc extends Bloc<GenerateImageEvent, GenerateImageState> {
  GenerateImageBloc() : super(GenerateImageInitial()) {
    on<EnterTextEvent>(enterTextEvent);
    on<GenerateInitialEvent>(generateInitialEvent);
  }

  FutureOr<void> enterTextEvent(
      EnterTextEvent event, Emitter<GenerateImageState> emit) async {
    emit(LoadingState());
    List<int>? file = await GenarateImageRepository.ImageGenerate(event.text);
    if (file != null) {
      emit(SuccessState(file: Uint8List.fromList(file)));
    } else {
      emit(ErrorState());
    }
  }

  Future<Uint8List> loadImageAsUint8List(String path) async {
  final File file = File(path);
  return await file.readAsBytes();
  }

  FutureOr<void> generateInitialEvent(
      GenerateInitialEvent event, Emitter<GenerateImageState> emit) async {

    try {
      Uint8List bytes = await File('C:/Users/Hafsa_Mehmood/Desktop/Flutter_Tasks/stun_ai-main/stun_ai/assets/image.png').readAsBytes();
      emit(SuccessState(file: bytes));
    } catch (e) {
      print('Error loading image: $e');
      // emit(ErrorState());
    }
  }
}
