import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_friends/domain/models/user.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/clickable.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:find_friends/ui/findtie/widgets/find_tie_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FindTieDetailScreen extends StatelessWidget {

  FindTieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User item = GoRouterState.of(context).extra as User;

    return Scaffold(
      backgroundColor: DGColors.background.normal,
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                width: double.infinity,
                  child: item.profilePicUrl.isNotEmpty ? CachedNetworkImage(
                      imageUrl: item.profilePicUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget:
                          (context, url, error) =>
                          Image.asset("assets/images/profile_placeholder.png"),
                    ) : Image.asset(
                      "assets/images/profile_placeholder.png",
                    width: double.infinity,
                  ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.nickname,
                          style: DGTypography.headline1Bold.copyWith(
                            color: DGColors.label.strong,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "${item.age}살 / ${item.residence}",
                          style: DGTypography.bodyMedium.copyWith(
                            color: DGColors.label.normal,
                          ),
                        ),
                      ],
                    ),
                    DGClickable(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: DGIcons.meatball.toImage(
                          width: 24,
                          height: 24,
                          color: DGColors.label.assistive,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Divider(thickness: 1, color: DGColors.line.normal),
                    ),
                    if(item.introduce != null)
                    FindTieDetailCard(
                        title: item.introduce!, items: []
                    ),
                    FindTieDetailCard(
                      title: "프로필",
                      items: [
                        if (item.height != null)
                        FindTieDetailItem(
                          title: "키",
                          content: "${item.height}cm",
                        ),
                          FindTieDetailItem(
                              title: "체형",
                              content: "보통"
                          )
                      ],
                    ),
                  ],
                ),
              SizedBox(height: 80),
            ],
          ),
          SafeArea(
            child: SizedBox(
              height: 48,
              child: DGTopBar(
                backgroundColor: Color(0x0000FFFF),
                iconColor: DGColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
