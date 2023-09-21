import 'package:roudy_story_box/common/color/color.dart';
import 'package:roudy_story_box/common/routes/index.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(
        background: AppColors.backgroundlight,
        primary: AppColors.primary,
        inverseSurface: AppColors.textIconColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundlight,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          foregroundColor: AppColors.filledButtonTextColor,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.filledButtonTextColor,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: AppColors.primary, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 17,
        ),
        prefixIconColor: AppColors.textFieldHintAndIconColor,
        suffixIconColor: AppColors.textFieldHintAndIconColor,
        filled: true,
        fillColor: AppColors.backgroundlight,
        hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.primary),
      ),
      chipTheme: const ChipThemeData(
        shape: BeveledRectangleBorder(),
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        checkmarkColor: AppColors.chipCheckMarkColor,
        side: BorderSide(
          color: AppColors.chipBorderColor,
        ),
        selectedColor: AppColors.selectedChipColor,
        disabledColor: AppColors.disabledChipColor,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        background: AppColors.textIconColor,
        primary: AppColors.primary,
        inverseSurface: AppColors.backgroundlight,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.textIconColor,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.all(8),
          shape: const CircleBorder(),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.filledButtonTextColor,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: AppColors.textFielEnabledBorderColor,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 22),
        prefixIconColor: AppColors.textFieldHintAndIconColor,
        suffixIconColor: AppColors.textFieldHintAndIconColor,
        filled: true,
        fillColor: AppColors.backgroundlight,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textFieldHintAndIconColor,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
      ),
      chipTheme: const ChipThemeData(
        labelStyle: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
        checkmarkColor: AppColors.chipCheckMarkColor,
        side: BorderSide(
          color: AppColors.chipBorderColor,
        ),
        selectedColor: AppColors.selectedChipColor,
        disabledColor: AppColors.disabledChipColor,
      ),
    );
  }
}
