import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:find_friends/domain/enums/gender.dart';
import 'package:find_friends/domain/enums/residence.dart';

final class MyEditState extends Equatable {
  final File? profileImageFile; // 선택된 이미지 파일
  final String? intro;
  final String? nickname;
  final Gender? gender;
  final Residence? residence;
  final int? height;
  final int? age;
  final DateTime? birth;

  const MyEditState({
    this.profileImageFile,
    this.intro,
    this.nickname,
    this.gender,
    this.residence,
    this.height,
    this.age,
    this.birth,
  });

  MyEditState copyWith({
    File? profileImageFile,
    String? intro,
    String? nickname,
    Gender? gender,
    Residence? residence,
    int? height,
    int? age,
    DateTime? birth,
  }) {
    return MyEditState(
      profileImageFile: profileImageFile ?? this.profileImageFile,
      intro: intro ?? this.intro,
      nickname: nickname ?? this.nickname,
      gender: gender ?? this.gender,
      residence: residence ?? this.residence,
      height: height ?? this.height,
      age: age ?? this.age,
      birth: birth ?? this.birth,
    );
  }

  @override
  List<Object?> get props => [profileImageFile, intro, nickname, gender, residence, height, age, birth];
}
