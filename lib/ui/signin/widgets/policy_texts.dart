import 'package:flutter/material.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/typography.dart';

class PolicyTexts extends StatelessWidget {
  const PolicyTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "‘전화번호 인증’ 버튼을 탭하면 서비스 약관 및 개인정보 처리방침에 동의하는 것으로 간주됩니다. SMS가 발송될 수 있으며, 메시지 및 데이터 요금이 부과될 수 있습니다.",
      style: DGTypography.labelRegular.copyWith(
        color: DGColors.label.assistive,
      ),
    );
  }
}
