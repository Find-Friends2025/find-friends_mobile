import 'package:cached_network_image/cached_network_image.dart';
import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/themes/icons.dart';
import 'package:find_friends/ui/core/themes/typography.dart';
import 'package:find_friends/ui/core/ui/clickable.dart';
import 'package:find_friends/ui/core/ui/topbar.dart';
import 'package:find_friends/ui/findtie/widgets/find_tie_detail_card.dart';
import 'package:flutter/material.dart';

class FindTieDetailScreen extends StatelessWidget {
  final List<String> testItems = ["test", "test1"];

  FindTieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DGColors.background.normal,
      body: Stack(
        children: [
          ListView(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                  imageUrl: "https://i.pravatar.cc/3000",
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
                          "박병준",
                          style: DGTypography.headline1Bold.copyWith(
                            color: DGColors.label.strong,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "23살 / 부산광역시",
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
              ...testItems.map(
                (test) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 16,
                      ),
                      child: Divider(thickness: 1, color: DGColors.line.normal),
                    ),
                    FindTieDetailCard(
                      title: test,
                      items: [
                        FindTieDetailItem(
                          title: test,
                          content: "${test}content",
                        ),
                        FindTieDetailItem(
                          title: test,
                          content: "${test}content",
                        ),
                      ],
                    ),
                  ],
                ),
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
