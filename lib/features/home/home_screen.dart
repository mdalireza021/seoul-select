import 'package:flutter/material.dart';
import 'package:seoul_select/custom_widgets/ScrollViewWithScrollBar.dart';
import 'package:seoul_select/theme/src/app_colors.dart';
import 'package:seoul_select/theme/src/app_icons.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';
import '../../utils/Const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScrollViewWithScrollBar(
      child: Container(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Searchbar and filter
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(
                            Icons.search,
                            color: AppColors.text,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Search...",
                            style: AppTextStyles.p7,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: SizedBox(
                      height: 45,
                      width: 45,
                      child: AppIcons.icon(
                        AppIcons.icFilter,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// banner
            SizedBox(
              height: 130.0,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        color: const Color(0xFFB9BDCC),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
              ),
            ),

            /// New Products
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Const.newProducts,
                  style: AppTextStyles.h3,
                ),
                Material(
                  color: AppColors.white,
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(3),
                  child: InkWell(
                    onTap: () => {},
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        Const.viewAll,
                        style: AppTextStyles.p10.copyWith(
                          height: 1.50,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              //height: double.infinity,
              height: 200,
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 130,
                          width: 130.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB9BDCC),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Text(
                          'VelocityStride',
                          style: AppTextStyles.p3,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// Best Sell
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Const.bestSell,
                  style: AppTextStyles.h3,
                ),
                Material(
                  clipBehavior: Clip.hardEdge,
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(3),
                  child: InkWell(
                    onTap: () => {},
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        Const.viewAll,
                        style: AppTextStyles.p10.copyWith(
                          height: 1.50,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 150,
            ),

            /// k beauty
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Const.kBeauty,
                  style: AppTextStyles.h3,
                ),
                Material(
                  clipBehavior: Clip.hardEdge,
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(3),
                  child: InkWell(
                    onTap: () => {},
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        Const.viewAll,
                        style: AppTextStyles.p10.copyWith(
                          height: 1.50,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 150,
            ),

            /// k food
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Const.kFood,
                  style: AppTextStyles.h3,
                ),
                Material(
                  clipBehavior: Clip.hardEdge,
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(3),
                  child: InkWell(
                    onTap: () => {},
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        Const.viewAll,
                        style: AppTextStyles.p10.copyWith(
                          height: 1.50,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 150,
            ),

            /// k health
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Const.kHealth,
                  style: AppTextStyles.h3,
                ),
                Material(
                  clipBehavior: Clip.hardEdge,
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(3),
                  child: InkWell(
                    onTap: () => {},
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        Const.viewAll,
                        style: AppTextStyles.p10.copyWith(
                          height: 1.50,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 150,
            ),

            /// k lifestyle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Const.kLifeStyle,
                  style: AppTextStyles.h3,
                ),
                Material(
                  clipBehavior: Clip.hardEdge,
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(3),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        Const.viewAll,
                        style: AppTextStyles.p10.copyWith(
                          height: 1.50,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
