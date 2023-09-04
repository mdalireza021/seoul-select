import 'package:flutter/cupertino.dart';
import 'package:seoul_select/custom_widgets/CustomButton.dart';
import 'package:seoul_select/theme/src/app_icons.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';

import '../../theme/src/app_colors.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppIcons.icon(
            AppIcons.icWishlist,
            size: AppIcons.sizeLarge,
            color: AppColors.textGray,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Empty WishList",
            style: AppTextStyles.h3.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "There is no item in wishList",
            style: AppTextStyles.p6,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: SizedBox(),
              ),
              Expanded(
                  flex: 4,
                  child: CustomButton(
                    label: "Shop now",
                    backgroundColor: AppColors.black,
                    onClick: () {},
                  )),
              const Expanded(
                flex: 3,
                child: SizedBox(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
