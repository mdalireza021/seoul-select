import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seoul_select/custom_widgets/CustomButton.dart';
import 'package:seoul_select/custom_widgets/ScrollViewWithScrollBar.dart';
import 'package:seoul_select/custom_widgets/custom_appbar.dart';
import 'package:seoul_select/custom_widgets/custom_dialog/signout_dialog.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';
import '../../theme/src/app_colors.dart';
import '../../theme/src/app_icons.dart';
import 'local/about_us_screen.dart';
import 'local/faqs_screen.dart';
import 'local/privacy_policy_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<Map<String, dynamic>> profileItems1 = [
    {
      "title": "Personal Details",
      "icon": AppIcons.icon(
        AppIcons.icPerson,
        color: AppColors.primary,
      ),
    },
    {
      "title": "My Order",
      "icon": AppIcons.icon(
        AppIcons.icMyOrder,
        color: AppColors.primary,
      ),
    },
    {
      "title": "Shipping Addresses",
      "icon": AppIcons.icon(
        AppIcons.icShippingAddress,
        color: AppColors.primary,
      ),
    },
    {
      "title": "My Card",
      "icon": AppIcons.icon(
        AppIcons.icMyCard,
        color: AppColors.primary,
      ),
    },
    {
      "title": "Settings",
      "icon": AppIcons.icon(
        AppIcons.icSettings,
        color: AppColors.primary,
      ),
    },
  ];

  final List<Map<String, dynamic>> profileItems2 = [
    {
      "title": "FAQs",
      "icon": AppIcons.icon(
        AppIcons.icFAQ,
        color: AppColors.primary,
      ),
    },
    {
      "title": "Privacy Policy",
      "icon": AppIcons.icon(
        AppIcons.icPrivacy,
        color: AppColors.primary,
      ),
    },
    {
      "title": "About Us",
      "icon": AppIcons.icon(
        AppIcons.icAboutUs,
        color: AppColors.primary,
      ),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: rootWidget(),
    );
  }

  Widget rootWidget() {
    return ScrollViewWithScrollBar(
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
        child: Column(
          children: [
            ///profile
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.textGray, width: 0.1),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x0C000000),
                      blurRadius: 10,
                      offset: Offset(0, 3),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 70,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB9BDCC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 15, 15, 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Md Ali Reza",
                              style: AppTextStyles.p2.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "mdalireza021@gmail.com",
                              style: AppTextStyles.p6,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            ///profile section 1
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: AppColors.textGray,
                  width: 0.4,
                ),
              ),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: profileItems1.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = profileItems1[index];
                      return menuItem(
                        index,
                        item["title"],
                        item["icon"],
                        (id) => {},
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            ///profile item2
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: AppColors.textGray,
                  width: 0.4,
                ),
              ),
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: profileItems2.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = profileItems2[index];
                        return menuItem(index, item["title"], item["icon"],
                            (id) {
                          switch (id) {
                            case 0:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const FaqsScreen()),
                              );
                              break;
                            case 1:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const PrivacyPolicyScreen(),
                                ),
                              );
                              break;

                            case 2:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const AboutUsScreen(),
                                ),
                              );
                              break;
                          }
                        });
                      })
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      svgIcon: SvgPicture.asset(
                        'assets/icons/ic_signout.svg',
                        color: AppColors.white,
                        width: 20,
                        height: 20,
                      ),
                      label: "SIGN OUT",
                      onClick: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => SignOutDialog(
                            onClick: () {},
                            onCancel: () => Navigator.of(context).pop(),
                          ),
                        );
                        print("sign out");
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget menuItem(
      int index, String title, Widget icon, Function(int id) onClick) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: AppColors.white,
        borderRadius: BorderRadius.circular(7),
        child: InkWell(
          onTap: () => onClick.call(index),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: icon,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  title,
                  style: AppTextStyles.p5.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
