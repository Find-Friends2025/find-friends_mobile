import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:find_friends/domain/repository/user_repository.dart';
import 'package:find_friends/ui/my/model/my_edit_event.dart';
import 'package:find_friends/ui/my/model/my_edit_state.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

@injectable
class MyEditViewModel extends Bloc<MyEditEvent, MyEditState> {
  final UserRepository _userRepository;

  MyEditViewModel(this._userRepository) : super(const MyEditState()) {
    on<MyEditInitStateEvent>(_onInitState);
    on<MyEditUploadEvent>(_onUpload);
    on<MyEditImageUploadToServerEvent>(_onUploadToServer);
    on<MyEditIntroChanged>((event, emit) async {
      final newState = state.copyWith(intro: event.intro);
      emit(newState);
      await _patchMyInfoWithState(newState);
    });
    on<MyEditNicknameChanged>((event, emit) async {
      final newState = state.copyWith(nickname: event.nickname);
      emit(newState);
      await _patchMyInfoWithState(newState);
    });
    on<MyEditGenderChanged>((event, emit) async {
      final newState = state.copyWith(gender: event.gender);
      emit(newState);
      await _patchMyInfoWithState(newState);
    });
    on<MyEditResidenceChanged>((event, emit) async {
      final newState = state.copyWith(residence: event.residence);
      emit(newState);
      await _patchMyInfoWithState(newState);
    });
    on<MyEditHeightChanged>((event, emit) async {
      final newState = state.copyWith(height: event.height);
      emit(newState);
      await _patchMyInfoWithState(newState);
    });
    on<MyEditAgeChanged>((event, emit) async {
      final newState = state.copyWith(age: event.age);
      emit(newState);
      await _patchMyInfoWithState(newState);
    });
    on<MyEditBirthChanged>((event, emit) async {
      final newState = state.copyWith(birth: event.birth);
      emit(newState);
      await _patchMyInfoWithState(newState);
    });
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> _onInitState(
    MyEditInitStateEvent event,
    Emitter<MyEditState> emit,
  ) async {
    emit(
      state.copyWith(
        profileImageUrl: event.user.profilePicUrl,
        intro: event.user.introduce,
        nickname: event.user.nickname,
        residence: event.user.residence,
        birth: event.user.birth,
        gender: event.user.bodyType,
        height: event.user.height,
        age: event.user.age,
      ),
    );
  }

  Future<void> _onUpload(
    MyEditUploadEvent event,
    Emitter<MyEditState> emit,
  ) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: event.source);
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        emit(state.copyWith(profileImageFile: file));
        add(MyEditImageUploadToServerEvent(imageFile: file));
      }
    } catch (e) {
      // 에러 처리 필요시 여기에
      print('사진 선택 실패: $e');
    }
  }

  Future<void> _onUploadToServer(
    MyEditImageUploadToServerEvent event,
    Emitter<MyEditState> emit,
  ) async {
    try {
      final dir = await getTemporaryDirectory();
      final targetPath = path.join(
        dir.path,
        "${DateTime.now().millisecondsSinceEpoch}.jpg",
      );

      final result = await FlutterImageCompress.compressAndGetFile(
        event.imageFile.absolute.path,
        targetPath,
        quality: 70, // 압축 품질 (0~100)
      );
      final url = await _userRepository.uploadProfileImage(File(result!.path));
      // TODO: emit state with uploaded image URL if needed
      print('업로드 성공: $url');
      final newState = state.copyWith(profileImageUrl: url);
      emit(newState);
      await _patchMyInfoWithState(newState);
    } catch (e) {
      print('이미지 업로드 실패: $e');
    }
  }

  Future<void> _patchMyInfoWithState(MyEditState s) async {
    await _userRepository.patchMyInfo(
      profilePicUrl: s.profileImageUrl ?? "", // 실제 URL로 교체 필요
      nickname: s.nickname ?? "",
      age: s.age ?? 0,
      residence: s.residence,
      height: s.height,
      bodyType: s.gender,
      introduce: s.intro,
      birth: s.birth != null ? _formatDate(s.birth!) : null,
    );
  }

  String _formatDate(DateTime date) {
    return "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
