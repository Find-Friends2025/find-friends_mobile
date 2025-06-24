import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/domain/models/user.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/line_button.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:find_friends/ui/my/model/my_edit_event.dart';
import 'package:find_friends/ui/my/model/my_edit_state.dart';
import 'package:find_friends/ui/my/viewmodel/my_edit_viewmodel.dart';
import 'package:find_friends/ui/my/widgets/my_bottom_sheet.dart';
import 'package:find_friends/ui/my/widgets/my_edit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MyEditScreen extends StatelessWidget {
  final User user;

  const MyEditScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MyEditViewModel>(),
      child: BlocBuilder<MyEditViewModel, MyEditState>(
        builder: (context, state) {
          return Scaffold(
            appBar: DGTopBar(
              title: Text("프로필 관리", style: DGTypography.title2Bold),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Column(
                  spacing: 8,
                  children: [
                    SizedBox(height: 0),
                    if (state.profileImageFile != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(99),
                        child: Image.file(
                          state.profileImageFile!,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      )
                    else
                      ClipRRect(
                        borderRadius: BorderRadius.circular(99),
                        child: CachedNetworkImage(
                          imageUrl: user.profilePicUrl,
                          width: 150,
                          height: 150,
                          placeholder:
                              (context, url) =>
                                  const CircularProgressIndicator(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    SizedBox(
                      width: 130,
                      child: DGLineButton(
                        text: "프로필 사진 수정",
                        buttonSize: LineButtonSize.medium,
                        onPressed: () {
                          _showPhotoPickerBottomSheet(context);
                        },
                        expand: true,
                      ),
                    ),
                    MyEditCard(
                      name: "자기소개",
                      content: user.introduce,
                      type: SheetType.text,
                    ),
                    MyEditCard(
                      name: "닉네임",
                      content: user.nickname,
                      type: SheetType.text,
                    ),
                    MyEditCard(
                      name: "성별",
                      content: user.bodyType,
                      type: SheetType.radio,
                    ),
                    // MyEditCard(
                    //   name: "생년월일",
                    //   content: user. "2007-08-07",
                    //   type: SheetType.date,
                    // ),
                    MyEditCard(
                      name: "거주지",
                      content: user.residence,
                      type: SheetType.residence,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showPhotoPickerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo),
                title: const Text("갤러리에서 선택"),
                onTap: () {
                  context.read<MyEditViewModel>().add(
                    MyEditUploadEvent(source: ImageSource.gallery),
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("카메라로 촬영"),
                onTap: () {
                  context.read<MyEditViewModel>().add(
                    MyEditUploadEvent(source: ImageSource.camera),
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
    );
  }
}
