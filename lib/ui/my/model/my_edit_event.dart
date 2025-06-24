import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:find_friends/domain/enums/gender.dart';
import 'package:find_friends/domain/enums/residence.dart';
import 'package:find_friends/domain/models/user.dart';
import 'package:image_picker/image_picker.dart';

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

final class MyEditIntroChanged extends MyEditEvent {
  final String intro;
  MyEditIntroChanged(this.intro);
}

final class MyEditNicknameChanged extends MyEditEvent {
  final String nickname;
  MyEditNicknameChanged(this.nickname);
}

final class MyEditGenderChanged extends MyEditEvent {
  final Gender gender;
  MyEditGenderChanged(this.gender);
}

final class MyEditResidenceChanged extends MyEditEvent {
  final Residence residence;
  MyEditResidenceChanged(this.residence);
}

final class MyEditHeightChanged extends MyEditEvent {
  final int height;
  MyEditHeightChanged(this.height);
}

final class MyEditAgeChanged extends MyEditEvent {
  final int age;
  MyEditAgeChanged(this.age);
}

final class MyEditBirthChanged extends MyEditEvent {
  final DateTime birth;
  MyEditBirthChanged(this.birth);
}

final class MyEditInitStateEvent extends MyEditEvent {
  final User user;
  MyEditInitStateEvent(this.user);
}
