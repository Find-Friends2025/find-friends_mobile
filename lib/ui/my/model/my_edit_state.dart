import 'dart:io';

import 'package:equatable/equatable.dart';

final class MyEditState extends Equatable {
  final File? profileImageFile; // 선택된 이미지 파일

  const MyEditState({this.profileImageFile});

  MyEditState copyWith({File? profileImageFile}) {
    return MyEditState(
      profileImageFile: profileImageFile ?? this.profileImageFile,
    );
  }

  @override
  List<Object?> get props => [profileImageFile];
}
