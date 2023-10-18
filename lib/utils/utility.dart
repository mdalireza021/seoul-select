import 'dart:math';

import 'package:flutter/material.dart';

import '../theme/src/app_colors.dart';
import '../theme/src/app_padding.dart';


bool isValidEmailAddress(String? email) {
  if (email == null) {
    return false;
  }
  return RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);
}

bool isValidPhoneNumber(String? phoneNo) {
  if (phoneNo == null) {
    return false;
  }
  RegExp regex = RegExp(r'^\(\d{3}\) \d{3}-\d{4}$');
  return regex.hasMatch(phoneNo);
}


String generateRandomDeviceId() {
  var r = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

  return List.generate(15, (index) => _chars[r.nextInt(_chars.length)]).join();
}

Future<void> mShowBottomSheet(BuildContext context, Widget bsView,
    {bool slideOverKeyboard = false}) {
  return showModalBottomSheet(
    useSafeArea: true,
    isScrollControlled: true,
    context: context,
    backgroundColor: AppColors.primary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppPadding.bottomSheetCornerRadius,),
        topRight: Radius.circular(AppPadding.bottomSheetCornerRadius,),
      ),
    ),
    builder: (BuildContext bc) {
      return Padding(
        padding: slideOverKeyboard
            ? EdgeInsets.only(bottom: MediaQuery.of(bc).viewInsets.bottom)
            : EdgeInsets.zero,
        child: bsView,
      );
    },
  );
}

// Widget mShimmer(Widget w) {
//   return Shimmer.fromColors(
//     baseColor: AppColors.shimmerBase,
//     highlightColor: AppColors.shimmerHighlight,
//     child: w,
//   );
// }

void removeFocusFromInputField(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}