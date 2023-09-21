// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:my_chat_app/common/colors/colors.dart';
// import 'package:my_chat_app/common/constants/constants.dart';
// import 'package:roudy_story_box/common/color/color.dart';

// class AppStyles {
//   static ThemeData lightTheme() {
//     return ThemeData.light().copyWith(
//       colorScheme: const ColorScheme.light(
//         background: AppColors.backgroundlight,
//         primary: AppColors.primary,
//         secondary: AppColors.secondary,
//         inversePrimary: AppColors.backgrounddark,
//       ),
//       appBarTheme: const AppBarTheme(
//         backgroundColor: AppColors.backgroundlight,
//         elevation: 0,
//       ),
//       outlinedButtonTheme: OutlinedButtonThemeData(
//           style: ButtonStyle(
//         backgroundColor:
//             MaterialStateProperty.resolveWith((states) => AppColors.primary),
//         minimumSize:
//             MaterialStateProperty.resolveWith((states) => Size(100.w, 35.h)),
//         enableFeedback: true,
//         padding: MaterialStateProperty.resolveWith(
//             (states) => EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h)),
//         textStyle: MaterialStateProperty.resolveWith(
//           (states) => TextStyle(
//               fontSize: 14.sp,
//               color: AppColors.backgroundlight,
//               fontWeight: FontWeight.w500,
//               fontFamily: AppConstants.fontfamily),
//         ),
//       )),
//       floatingActionButtonTheme: const FloatingActionButtonThemeData(
//           backgroundColor: AppColors.backgrounddark,
//           foregroundColor: AppColors.backgrounddark,
//           splashColor: AppColors.backgrounddark,
//           elevation: 4,
//           enableFeedback: true,
//           shape: OvalBorder()),
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: AppColors.backgroundlight,
//         errorStyle: TextStyle(
//             fontSize: 14.sp,
//             color: AppColors.error,
//             fontFamily: AppConstants.fontfamily,
//             fontWeight: FontWeight.normal),
//         hintStyle: TextStyle(
//             fontSize: 14.sp,
//             color: AppColors.textligthdark,
//             fontFamily: AppConstants.fontfamily,
//             fontWeight: FontWeight.normal),
//         suffixStyle: TextStyle(
//             fontSize: 12.sp,
//             color: AppColors.primary,
//             fontFamily: AppConstants.fontfamily,
//             fontWeight: FontWeight.normal),
//         isDense: true,
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppConstants.borderradius),
//             borderSide: BorderSide(
//               width: AppConstants.borderwidth,
//               color: AppColors.primary,
//             )),
//         errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppConstants.borderradius),
//             borderSide: BorderSide(
//               width: AppConstants.borderwidth,
//               color: AppColors.error,
//             )),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppConstants.borderradius),
//             borderSide: BorderSide(
//               width: AppConstants.borderwidth,
//               color: AppColors.backgrounddark.withOpacity(0.6),
//             )),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppConstants.borderradius),
//             borderSide: BorderSide(
//               width: AppConstants.borderwidth,
//               color: AppColors.primary,
//             )),
//         disabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppConstants.borderradius),
//             borderSide: BorderSide(
//               width: AppConstants.borderwidth,
//               color: AppColors.backgrounddark,
//             )),
//         focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppConstants.borderradius),
//             borderSide: BorderSide(
//               width: AppConstants.borderwidth,
//               color: AppColors.primary,
//             )),
//       ),
//       brightness: Brightness.light,
//     );
//   }

//   static ThemeData darkTheme() {
//     return ThemeData.dark().copyWith(
//       colorScheme: const ColorScheme.dark(
//         background: AppColors.backgrounddark,
//         primary: AppColors.primary,
//         secondary: AppColors.secondary,
//         inversePrimary: AppColors.backgroundlight,
//       ),
//       brightness: Brightness.dark,
//       appBarTheme: const AppBarTheme(
//         backgroundColor: AppColors.backgrounddark,
//         elevation: 0,
//       ),
//       outlinedButtonTheme: OutlinedButtonThemeData(
//           style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.resolveWith(
//                   (states) => AppColors.primary),
//               minimumSize: MaterialStateProperty.resolveWith(
//                   (states) => Size(100.w, 35.h)),
//               enableFeedback: true,
//               padding: MaterialStateProperty.resolveWith((states) =>
//                   EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h)),
//               textStyle: MaterialStatePropertyAll(
//                 TextStyle(
//                     fontSize: 14.sp,
//                     color: AppColors.backgrounddark,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: AppConstants.fontfamily),
//               ))),
//       floatingActionButtonTheme: const FloatingActionButtonThemeData(
//           backgroundColor: AppColors.backgroundlight,
//           foregroundColor: AppColors.backgroundlight,
//           splashColor: AppColors.backgroundlight,
//           elevation: 4,
//           enableFeedback: true,
//           shape: OvalBorder()),
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: AppColors.backgrounddark,
//         errorStyle: TextStyle(
//             fontSize: 14.sp,
//             color: AppColors.error,
//             fontFamily: AppConstants.fontfamily,
//             fontWeight: FontWeight.normal),
//         hintStyle: TextStyle(
//             fontSize: 14.sp,
//             color: AppColors.textligthdark,
//             fontFamily: AppConstants.fontfamily,
//             fontWeight: FontWeight.normal),
//         suffixStyle: TextStyle(
//             fontSize: 12.sp,
//             color: AppColors.primary,
//             fontFamily: AppConstants.fontfamily,
//             fontWeight: FontWeight.normal),
//         isDense: true,
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppConstants.borderradius),
//             borderSide: BorderSide(
//               width: AppConstants.borderwidth,
//               color: AppColors.primary,
//             )),
//         errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppConstants.borderradius),
//             borderSide: BorderSide(
//               width: AppConstants.borderwidth,
//               color: AppColors.error,
//             )),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppConstants.borderradius),
//             borderSide: BorderSide(
//               width: AppConstants.borderwidth,
//               color: AppColors.backgroundlight.withOpacity(0.6),
//             )),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppConstants.borderradius),
//             borderSide: BorderSide(
//               width: AppConstants.borderwidth,
//               color: AppColors.primary,
//             )),
//         disabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppConstants.borderradius),
//             borderSide: BorderSide(
//               width: AppConstants.borderwidth,
//               color: AppColors.backgrounddark,
//             )),
//         focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppConstants.borderradius),
//             borderSide: BorderSide(
//               width: AppConstants.borderwidth,
//               color: AppColors.primary,
//             )),
//       ),
//     );
//   }
// }