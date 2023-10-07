import 'package:flutter/material.dart';
import 'package:seoul_select/custom_widgets/ScrollViewWithScrollBar.dart';
import 'package:seoul_select/custom_widgets/custom_appbar2.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';
import '../../../theme/src/app_colors.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  List<Data> items = [
    Data(
        title: "Information We Collect",
        description:
            "Personal Information: To provide you with our services, we may collect personal information such as your name, email address, phone number, shipping address, and payment information when you make a purchase.\n\nUsage Data: We may collect information about how you use our application, including your browsing history, the pages you visit, and the products you view. This data helps us improve your shopping experience and tailor our offerings to your preferences."),
    Data(
        title: "How We Use Your Information",
        description:
            "Order Fulfillment: We use your personal information to process your orders, deliver products, and communicate with you about your purchases.\n\nImprovement of Services: We analyze usage data to enhance our application's functionality, personalize content, and improve our product offerings.\n\nCommunication: With your consent, we may send you promotional emails or notifications about new products, special offers, or events. You can opt out of these communications at any time."),
    Data(
        title: "Data Security",
        description:
            "We take your data security seriously. We employ industry-standard security measures to protect your personal information from unauthorized access, disclosure, or alteration. Our payment processing partners use encryption to ensure the security of your financial data."),
    Data(
        title: "Third-Party Services",
        description:
            "Seoul Select may utilize third-party services, such as payment processors and analytics tools, to enhance our offerings. These third parties may have their own privacy policies, and we encourage you to review them to understand how they handle your data."),
    Data(
        title: "Cookies and Tracking Technologies",
        description:
            "Seoul Select and our third-party partners may use cookies and tracking technologies to enhance your experience while using our mobile application. These technologies are used to collect information about your browsing activities and preferences. Here's how we use them:\n\nCookies: Cookies are small text files stored on your device when you visit our application. We use cookies to remember your preferences, enable certain features, and provide you with a more personalized experience. You can manage or disable cookies through your browser settings, but please note that this may affect the functionality of our application.\n\nAnalytics: We use analytics tools to collect information about how you interact with our application. This data helps us understand user behavior, improve our services, and make informed decisions about content and features.\n\nAdvertising: We may work with third-party advertising partners who use cookies and similar technologies to display relevant ads to you. These ads may be based on your interests and browsing history. You can opt out of personalized advertising in your device settings or through the settings within our application.\n\nBy using our application, you consent to the use of cookies and tracking technologies as described above. Please note that third-party websites and services linked from our application may have their own cookie and tracking policies, which we encourage you to review."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar2(
        title: 'Privacy Policy',
        automaticallyImplyLeading: true,
      ),
      body: rootWidget(),
    );
  }

  Widget rootWidget() {
    return ScrollViewWithScrollBar(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "This privacy policy was last updated on October 04, 2023.",
              textAlign: TextAlign.justify,
              style: AppTextStyles.h3,
            ),
            const SizedBox(height: 10),
            Text(
              "At Seoul Select, we are committed to safeguarding your privacy. This Privacy Policy outlines our practices regarding the collection, use, and protection of your personal information when you use our mobile application. By accessing or using Seoul Select, you consent to the terms described in this Privacy Policy.",
              textAlign: TextAlign.justify,
              style: AppTextStyles.p1,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: ListView.builder(
                //scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildPlayerModelList(items[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerModelList(item) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xFFDFE2E8), width: 1),
        ),
        child: ExpansionTile(
         iconColor: AppColors.textGray,
          title: Text(
            item.title,
            style: AppTextStyles.p1.copyWith(),
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                item.description,
                textAlign: TextAlign.justify,
                style: AppTextStyles.p1.copyWith(
                  color: const Color(0xFF363B4B),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Data {
  final String title;
  final String description;

  Data({
    required this.title,
    required this.description,
  });
}
