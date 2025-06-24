import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/data/core/storage/token_storage.dart';
import 'package:find_friends/domain/repository/user_repository.dart';
import 'package:find_friends/main.dart';
import 'package:find_friends/routing/routes.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/home_bottom_navigation_widget.dart';
import 'package:find_friends/ui/core/ui/home_top_bar_widget.dart';
import 'package:find_friends/ui/core/ui/line_button.dart';
import 'package:find_friends/ui/my/model/my_event.dart';
import 'package:find_friends/ui/my/model/my_state.dart';
import 'package:find_friends/ui/my/viewmodel/my_viewmodel.dart';
import 'package:find_friends/ui/my/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  late MyViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = MyViewModel(getIt<UserRepository>());
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ModalRoute.of(context)?.isCurrent ?? false) {
        viewModel.add(MyLoadEvent());
      }
    });
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<MyViewModel, MyState>(
        builder: (context, state) {
          return Scaffold(
            appBar: HomeTopBarWidget(title: "마이페이지", actions: []),
            bottomNavigationBar: HomeBottomNavigationWidget(
              selectedItem: HomeBottomNavItems.my,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8,
                children: [
                  SizedBox(height: 0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(99),
                    child: CachedNetworkImage(
                      imageUrl: state.myInfo?.profilePicUrl ?? "",
                      placeholder:
                          (context, url) => CircularProgressIndicator(),
                      width: 150,
                      height: 150,
                    ),
                  ),
                  if (state.myInfo != null)
                    SizedBox(
                      width: 228,
                      child: DGLineButton(
                        text: "프로필 관리",
                        buttonSize: LineButtonSize.medium,
                        onPressed: () {
                          context.push(Routes.myEdit.path, extra: state.myInfo);
                        },
                        expand: true,
                        leadingIcon: DGIcons.pencil,
                      ),
                    ),
                  if (state.myInfo?.introduce?.isEmpty ?? true)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 8,
                      children: [
                        DGIcons.attentionTriangle.toImage(
                          width: 16,
                          height: 16,
                          color: DGColors.static.negative,
                        ),
                        Text(
                          "자기소개가 입력되어 있지 않습니다.",
                          style: DGTypography.labelRegular.copyWith(
                            color: DGColors.static.negative,
                          ),
                        ),
                      ],
                    ),
                  Container(
                    color: DGColors.line.neutral,
                    width: double.infinity,
                    height: 1,
                    margin: EdgeInsets.symmetric(vertical: 8),
                  ),
                  MyCard(text: "공지 사항", onPressed: () {}),
                  MyCard(text: "내가 보낸 좋아요", onPressed: () {}),
                  MyCard(
                    text: "로그아웃",
                    textColor: DGColors.static.negative,
                    onPressed: () {
                      TokenStorage().delete().then((value) {
                        goDefaultPage();
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
