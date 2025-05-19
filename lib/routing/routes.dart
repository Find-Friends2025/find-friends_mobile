import 'package:find_friends/ui/chat/chat_screen.dart';
import 'package:find_friends/ui/chatdetail/chat_detail_screen.dart';
import 'package:find_friends/ui/findtie/find_tie_screen.dart';
import 'package:find_friends/ui/like/like_screen.dart';
import 'package:find_friends/ui/my/my_edit_screen.dart';
import 'package:find_friends/ui/my/my_screen.dart';
import 'package:find_friends/ui/my/notice_board_screen.dart';
import 'package:find_friends/ui/profilepicture/profile_picture_screen.dart';
import 'package:find_friends/ui/searchfilter/search_filter_screen.dart';
import 'package:find_friends/ui/signin/widgets/screen/code_send_screen.dart';
import 'package:find_friends/ui/signin/widgets/screen/start_screen.dart';
import 'package:find_friends/ui/signin/widgets/screen/terms_screen.dart';
import 'package:find_friends/ui/signin/widgets/screen/verify_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_birth_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_gender_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_meet_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_nick_screen.dart';
import 'package:find_friends/ui/signup/widgets/screen/signup_residence_screen.dart';
import 'package:flutter/material.dart';

enum Routes {
  start(StartScreen()), terms(TermsScreen()), codeSend(CodeSendScreen()), verify(VerifyScreen()),
  signupFirst(SignupMeetScreen()), signupSecond(SignupGenderScreen()), signupThird(SignupBirthScreen()), signupFourth(SignupResidenceScreen()), signupFifth(SignupNickScreen()),
  profilePicture(ProfilePictureScreen()),
  findTie(FindTieScreen()), like(LikeScreen()), chat(ChatScreen()), my(MyScreen()),
  myEdit(MyEditScreen()), noticeBoard(NoticeBoardScreen()),
  chatDetail(ChatDetailScreen()),
  searchFilter(SearchFilterScreen());

  const Routes(this.screen);
  final Widget screen;
}