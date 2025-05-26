import 'package:find_friends/ui/core/themes/colors.dart';
import 'package:find_friends/ui/core/ui/button.dart';
import 'package:find_friends/ui/core/ui/textfield.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../domain/enums/gender.dart';
import '../../../domain/enums/residence.dart';
import '../../core/themes/typography.dart';
import '../../core/ui/checkbox.dart';

enum SheetType { text, date, radio, residence }

class MyBottomSheet extends StatefulWidget {
  final TextEditingController? controller;
  final SheetType type;
  const MyBottomSheet({super.key, this.controller, required this.type});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    DateTime _focusedDay = DateTime.now();
    DateTime? _selectedDay;
    Gender? _selectedGender;

    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              (() {
                switch (widget.type) {
                  case SheetType.text:
                    return DGTextField(
                      controller: widget.controller ?? TextEditingController(),
                      hintText: "내용을 입력하세요.",
                    );
                  case SheetType.date:
                    return TableCalendar(
                      firstDay: DateTime.utc(1900, 1, 1),
                      lastDay: DateTime.now(),
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      },
                      calendarStyle: CalendarStyle(
                        todayDecoration: BoxDecoration(
                          color: DGColors.primary.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: DGColors.primary,
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: TextStyle(color: Colors.white),
                        weekendTextStyle: TextStyle(
                          color: DGColors.static.negative,
                        ),
                        outsideTextStyle: TextStyle(
                          color: DGColors.label.assistive,
                        ),
                      ),
                    );
                  case SheetType.radio:
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        spacing: 24,
                        children: [
                          for (var gender in Gender.values)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 24),
                              child: Row(
                                children: [
                                  DGCheckbox(
                                    isToggled: _selectedGender == gender,
                                    onTap: (bool _) {
                                      setState(() {
                                        _selectedGender = gender;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 20),
                                  Text(
                                    gender.alias,
                                    style: DGTypography.headline1Bold,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    );
                  case SheetType.residence:
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: List.generate(
                            Residence.values.length,
                            (i) => Text(Residence.values[i].alias),
                          ),
                        ),
                      ),
                    );
                }
              })(),
              Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DGButton(
                  text: "확인",
                  buttonSize: ButtonSize.large,
                  expand: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
