import 'package:find_friends/ui/chat/chat_screen.dart';
import 'package:find_friends/ui/chatdetail/chat_detail_screen.dart';
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

enum Routes {
  start('/start', StartScreen()),
  terms('/terms', TermsScreen()),
  codeSend('/codesend', CodeSendScreen()),
  verify('/verify', VerifyScreen()),
  signupFirst('/signup/meet', SignupMeetScreen()),
  signupSecond('/signup/gender', SignupGenderScreen()),
  signupThird('/signup/birth', SignupBirthScreen()),
  signupFourth('/signup/residence', SignupResidenceScreen()),
  signupFifth('/signup/nick', SignupNickScreen()),
  profilePicture('/profilepicture', ProfilePictureScreen()),
  findTie('/findtie', FindTieScreen()),
  like('/like', LikeScreen()),
  chat('/chat', ChatScreen()),
  my('/my', MyScreen()),
  myEdit('/my/edit', MyEditScreen()),
  noticeBoard('/my/noticeboard', NoticeBoardScreen()),
  chatDetail('/chatdetail', ChatDetailScreen()),
  searchFilter('/searchfilter', SearchFilterScreen());

  const Routes(this.path, this.screen);
  final String path;
  final Widget screen;
}