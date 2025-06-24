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
    on<MyEditUploadEvent>(_onUpload);
    on<MyEditImageUploadToServerEvent>(_onUploadToServer);
  }

  final ImagePicker _picker = ImagePicker();

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
    } catch (e) {
      print('이미지 업로드 실패: $e');
    }
  }
}
