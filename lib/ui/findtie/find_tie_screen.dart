import 'package:find_friends/config/injectable_init.dart';
import 'package:find_friends/domain/models/user.dart';
import 'package:find_friends/domain/repository/user_repository.dart';
import 'package:find_friends/routing/routes.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/home_bottom_navigation_widget.dart';
import 'package:find_friends/ui/core/ui/home_top_bar_widget.dart';
import 'package:find_friends/ui/findtie/models/find_tie_event.dart';
import 'package:find_friends/ui/findtie/view_model/find_tie_view_model.dart';
import 'package:find_friends/ui/findtie/widgets/find_tie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'models/find_tie_state.dart';

class FindTieScreen extends StatelessWidget {

  const FindTieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = (screenWidth - 8 * 3) / 2;
  return BlocProvider.value(value: getIt<FindTieViewModel>()..add(FindTieLoadEvent()),
      child: BlocBuilder<FindTieViewModel, FindTieState>(
        builder: (context, state) => Scaffold(
          appBar: HomeTopBarWidget(
            title: "추천순",
            actions: [DGIcons.magnifyingglass],
            showPolygon: true,
            onClickAction: (icon) {
              context.push(Routes.searchFilter.path);
            },
          ),
          bottomNavigationBar: HomeBottomNavigationWidget(
            selectedItem: HomeBottomNavItems.findTie,
          ),
          body:
          state.userList.isEmpty
              ? Center(
            child: Text(
              "해당 회원을 찾지 못하였습니다.",
              style: DGTypography.headline2Regular,
              textAlign: TextAlign.center,
            ),
          )
              : SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Wrap(
              spacing: 8,
              runSpacing: 12,
              children: List.generate(state.userList.length, (index) {
                User item = state.userList[index];
                if (item.id == 4) { return Container(); }

                return SizedBox(
                  width: itemWidth,
                  child: GestureDetector(
                    onTap: () {
                      context.push(Routes.findTieDetail.path, extra: item);
                    },
                    child: FindTieCard(
                      imageUrl: item.profilePicUrl,
                      userName: item.nickname,
                      userLocation: item.residence,
                      isOnline: false,
                      isLike: true,
                    )
                  ) ,
                );
              }),
            ),
          ),
        ),
      ));
  }
}
