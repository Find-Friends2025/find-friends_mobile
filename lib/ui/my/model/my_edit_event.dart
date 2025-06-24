import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

abstract class MyEditEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

final class MyEditUploadEvent extends MyEditEvent {
  final ImageSource source;
  MyEditUploadEvent({required this.source});
}

final class MyEditImageUploadToServerEvent extends MyEditEvent {
  final File imageFile;
  MyEditImageUploadToServerEvent({required this.imageFile});
}
