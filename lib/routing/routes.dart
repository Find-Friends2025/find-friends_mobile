import 'package:find_friends/domain/models/user.dart';
import 'package:find_friends/ui/chat/chat_screen.dart';
import 'package:find_friends/ui/chatdetail/chat_detail_screen.dart';
import 'package:find_friends/ui/findtie/find_tie_detail_screen.dart';
import 'package:find_friends/ui/findtie/find_tie_screen.dart';
import 'package:find_friends/ui/like/like_screen.dart';
import 'package:find_friends/ui/my/my_edit_screen.dart';
import 'package:find_friends/ui/my/my_screen.dart';
import 'package:find_friends/ui/my/notice_board_screen.dart';
import 'package:find_friends/ui/profilepicture/profile_picture_screen.dart';
import 'package:find_friends/ui/searchfilter/search_filter_screen.dart';
import 'package:find_friends/ui/signin/code_send_screen.dart';
import 'package:find_friends/ui/signin/start_screen.dart';
import 'package:find_friends/ui/signin/terms_screen.dart';
import 'package:find_friends/ui/signin/verify_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_birth_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_gender_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_meet_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_nick_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_residence_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  start('/start'),
  terms('/terms'),
  codeSend('/codesend'),
  verify('/verify'),
  signupFirst('/signup/meet'),
  signupSecond('/signup/gender'),
  signupThird('/signup/birth'),
  signupFourth('/signup/residence'),
  signupFifth('/signup/nick'),
  profilePicture('/profilepicture'),
  findTie('/findtie'),
  findTieDetail('/findtie/detail'),
  like('/like'),
  chat('/chat'),
  my('/my'),
  myEdit('/my/edit'),
  noticeBoard('/my/noticeboard'),
  chatDetail('/chatdetail'),
  searchFilter('/searchfilter');

  const Routes(this.path);
  final String path;

  Widget getScreen(GoRouterState state) {
    switch (this) {
      case Routes.start:
        return const StartScreen();
      case Routes.terms:
        return const TermsScreen();
      case Routes.codeSend:
        return const CodeSendScreen();
      case Routes.verify:
        return const VerifyScreen();
      case Routes.signupFirst:
        return const SignupMeetScreen();
      case Routes.signupSecond:
        return const SignupGenderScreen();
      case Routes.signupThird:
        return const SignupBirthScreen();
      case Routes.signupFourth:
        return const SignupResidenceScreen();
      case Routes.signupFifth:
        return const SignupNickScreen();
      case Routes.profilePicture:
        return const ProfilePictureScreen();
      case Routes.findTie:
        return const FindTieScreen();
      case Routes.findTieDetail:
        return FindTieDetailScreen();
      case Routes.like:
        return const LikeScreen();
      case Routes.chat:
        return const ChatScreen();
      case Routes.my:
        return const MyScreen();
      case Routes.myEdit:
        return MyEditScreen(user: state.extra as User);
      case Routes.noticeBoard:
        return const NoticeBoardScreen();
      case Routes.chatDetail:
        return const ChatDetailScreen();
      case Routes.searchFilter:
        return const SearchFilterScreen();
    }
  }
}
