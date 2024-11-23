import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nots_app/controllers/cubits/app_language/app_language_cubit.dart';
import 'package:nots_app/controllers/cubits/theme_cubit/theme_cubit.dart';
import 'package:nots_app/controllers/models/Enums/languagesEventType.dart';
import 'package:nots_app/generated/l10n.dart';
import 'package:nots_app/views/widgets/delete_notes_alarm.dart';

class SettingDialog extends StatefulWidget {
  const SettingDialog({super.key});

  @override
  State<SettingDialog> createState() => _SettingDialogState();
}

class _SettingDialogState extends State<SettingDialog> {
  bool light = true;

  final List<bool> _isSelected = [true, false];

  @override
  void initState() {
    super.initState();
    // قراءة اللغة المحفوظة من AppLanguageCubit
    final currentLanguage =
        context.read<AppLanguageCubit>().state is AppLanguageChanged
            ? (context.read<AppLanguageCubit>().state as AppLanguageChanged)
                .languageCode
            : 'en';

    // ضبط الحالة بناءً على اللغة المحفوظة
    _isSelected[0] = currentLanguage == 'ar';
    _isSelected[1] = currentLanguage == 'en';
  }

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  S.of(context).settings,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 20.0),
                  child: Text(
                    S.of(context).dark_mode,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 24.0.sp,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, right: 20.0),
                  child: Switch(
                    value: context.read<ThemeCubit>().state == ThemeMode.light,
                    onChanged: (value) {
                      themeCubit.toggleTheme();
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12.0.h, left: 20.h),
                  child: Text(
                    S.of(context).language,
                    style: GoogleFonts.alegreya(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 24.0.sp,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 12.0.h, right: 20.h),
                  child: BlocBuilder<AppLanguageCubit, AppLanguageState>(
                    builder: (context, state) {
                      if (state is AppLanguageChanged) {
                        _isSelected[0] = state.languageCode == 'ar';
                        _isSelected[1] = state.languageCode == 'en';
                      }

                      return ToggleButtons(
                        isSelected: _isSelected,
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0; i < _isSelected.length; i++) {
                              _isSelected[i] = i == index;
                            }
                          });

                          if (index == 0) {
                            context
                                .read<AppLanguageCubit>()
                                .appLanguageFunc(LanguagesEventEnums
                                    .ArabicLanguage);
                          } else {
                            context
                                .read<AppLanguageCubit>()
                                .appLanguageFunc(LanguagesEventEnums
                                    .EnglishLanguage);
                          }
                        },
                        borderRadius: BorderRadius.circular(20.r),
                        selectedColor: Colors.white,
                        fillColor: Colors.blue,
                        color: Colors.grey,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 12.0.w),
                            child: Text(S.of(context).ar,
                                style: TextStyle(fontSize: 18.sp)),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 12.0.w),
                            child: Text(S.of(context).en,
                                style: TextStyle(fontSize: 18.sp)),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 28.h),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 12.0.h, left: 20.h),
                  child: Text(
                    S.of(context).delete_all_notes,
                    style: GoogleFonts.alegreya(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 24.0.sp,
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 12.h, right: 20.h),
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const DeleteNotesAlarm(),
                      );
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.trashCan,
                      size: 28,
                    ),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
