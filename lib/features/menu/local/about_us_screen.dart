import 'package:flutter/material.dart';
import 'package:seoul_select/custom_widgets/ScrollViewWithScrollBar.dart';
import 'package:seoul_select/custom_widgets/custom_appbar2.dart';
import 'package:seoul_select/theme/src/app_icons.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';
import '../../../theme/src/app_colors.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar2(
        title: 'About Us',
        automaticallyImplyLeading: true,
      ),
      body: rootWidget(),
    );
  }

  Widget rootWidget() {
    return ScrollViewWithScrollBar(
      child: Column(
        children: [
          const SizedBox(height: 10),

          /// about us
          Container(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 50),
            decoration: const BoxDecoration(
              color: Color(0xFF40434D),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'ABOUT US',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h2.copyWith(
                    color: AppColors.white,
                    letterSpacing: 0.60,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Welcome to Seoul Select, your exclusive gateway to the vibrant world of South Korea, now tailored exclusively for the discerning community in Bangladesh.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.h3.copyWith(
                    color: AppColors.white,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// Our Mission
          Container(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            decoration: const BoxDecoration(
              color: Color(0xFFF0F2F5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 358,
                    height: 210,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB9BDCC),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Our Mission',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'At Seoul Select, our mission is to be the premier destination for authentic Korean products in Bangladesh. We have a deep understanding of the immense love for Korean culture and products within Bangladesh, and we\'re here to fulfill that demand. Our dedicated team scours the Korean market to source the finest products that showcase the country\'s innovation, craftsmanship, and diversity. Whether you\'re a seasoned K-culture enthusiast or someone new to Korean treasures, we aspire to be your trusted partner in discovering and enjoying the best of Korea, right here in Bangladesh.',
                  textAlign: TextAlign.justify,
                  style: AppTextStyles.p1,
                ),
              ],
            ),
          ),

          /// Our Values
          const SizedBox(height: 24),
          Center(
            child: Text(
              'Our Values',
              textAlign: TextAlign.center,
              style: AppTextStyles.h2,
            ),
          ),

          /// Our values section 1
          Container(
            //color: Colors.grey,
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFB9BDCC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "We are committed to showcasing the best of South Korea exclusively to the vibrant people of Bangladesh. Our dedication to excellence means that every product we offer is chosen with the discerning tastes and preferences of the Bangladeshi community in mind. We take pride in being the bridge that connects the rich traditions of Korea with the unique and diverse culture of Bangladesh.",
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.p2.copyWith(
                      height: 1.1,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Our values section 2
          const SizedBox(height: 24),
          Container(
            //color: Colors.grey,
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF232323),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Your satisfaction is at the heart of everything we do. We are passionate about delivering exceptional service, prompt deliveries, and a seamless shopping experience tailored to the needs of our Bangladeshi customers. We value your trust and are driven to consistently exceed your expectations. ',
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.p2.copyWith(
                      height: 1.1,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Our values section 3
          const SizedBox(height: 30),
          Container(
            //color: Colors.grey,
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFDFE2E8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Seoul Select is more than just a marketplace; it\'s where two cultures meet and blend harmoniously. We believe in the power of cultural exchange, and our curated collection reflects this fusion. We are committed to celebrating the shared values and appreciation for Korean culture within the Bangladeshi community, fostering a stronger sense of global connectedness.',
                    textAlign: TextAlign.justify,
                    style: AppTextStyles.p2.copyWith(
                      height: 1.1,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// Join to our community
          const SizedBox(height: 30),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Join Our Community',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.h2.copyWith(
                      color: const Color(0xFF232323),
                      height: 0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///facebook
                  Material(
                    color: const Color(0xFF363B4B),
                    //color: AppColors.primary,
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                        child: AppIcons.icon(
                          AppIcons.icFacebook,
                          color: AppColors.white,
                          size: AppIcons.sizeSmall,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  ///instagram
                  Material(
                    color: const Color(0xFF363B4B),
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                        child: AppIcons.icon(
                          AppIcons.icInstagram,
                          color: AppColors.white,
                          size: AppIcons.sizeSmall,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  ///twitter
                  Material(
                    color: const Color(0xFF363B4B),
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                        child: AppIcons.icon(
                          AppIcons.icTwitter,
                          color: AppColors.white,
                          size: AppIcons.sizeSmall,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  ///youtube
                  Material(
                    color: const Color(0xFF363B4B),
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(50),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
                        child: AppIcons.icon(
                          AppIcons.icYoutube,
                          color: AppColors.white,
                          size: AppIcons.sizeSmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// Footer
          const SizedBox(height: 50),
          Center(
            child: Text(
              '© 2023 Seoul Select, All Rights Reserved.',
              textAlign: TextAlign.center,
              style: AppTextStyles.p3.copyWith(
                color: const Color(0xFF232323),
                height: 0.11,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
