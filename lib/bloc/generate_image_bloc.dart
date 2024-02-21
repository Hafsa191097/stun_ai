import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final ByteData data = await rootBundle.load(path);
  Uint8List bytes = data.buffer.asUint8List();
  return bytes;
  
  }

  FutureOr<void> generateInitialEvent(
      GenerateInitialEvent event, Emitter<GenerateImageState> emit) async {

    try {
      final Uint8List imageData = await loadImageAsUint8List('assets/image.png');
      emit(SuccessState(file: imageData));
    } catch (e) {
      log('Error loading image: $e');
      emit(ErrorState());
    }
  }
}
