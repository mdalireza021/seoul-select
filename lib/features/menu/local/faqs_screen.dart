import 'package:flutter/material.dart';
import 'package:seoul_select/custom_widgets/ScrollViewWithScrollBar.dart';
import 'package:seoul_select/custom_widgets/custom_appbar2.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';

import '../../../theme/src/app_colors.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  List<Data> items = [
    Data(
      title: "What is Seoul Select?",
      description:
          "Seoul Select is a dedicated mobile application that brings authentic Korean products to the Bangladesh market. We offer a curated selection of Korean food, beauty cosmetics, educational items, and lifestyle products.",
    ),
    Data(
      title: "How can I download the Seoul Select app?",
      description:
          "You can download the Seoul Select app from the App Store (for iOS devices) or Google Play Store (for Android devices).",
    ),
    Data(
      title: "Is Seoul Select available only in Bangladesh?",
      description:
          "Yes, Seoul Select is exclusively available in Bangladesh to cater to the demand for Korean products in this market.",
    ),
    Data(
      title: "Do I need an account to make a purchase?",
      description:
          "Yes, you'll need to create an account to place an order. This helps us provide you with a seamless shopping experience and track your orders.",
    ),
    Data(
      title: "How can I track my order?",
      description:
          "We accept various payment methods, including credit/debit cards and digital payment platforms. You can find the full list of accepted payment options during the checkout process.",
    ),

    Data(
      title: "Are the products on Seoul Select authentic Korean products?",
      description:
      "Yes, we take pride in offering only authentic Korean products sourced directly from Korea to ensure their quality and authenticity.",
    ),

    Data(
      title: "Do you offer product reviews and ratings?",
      description:
      "Yes, you can find product reviews and ratings from other customers to help you make informed purchase decisions.",
    ),

    Data(
      title: "Can I return or exchange a product?",
      description:
      "Our return and exchange policy may vary depending on the product and the circumstances. Please refer to our Return Policy for detailed information.",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar2(
        title: 'FAQs',
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
              "Welcome to the Seoul Select FAQ section! We've compiled answers to some of the most common questions to help you navigate our application and make the most of your Korean shopping experience. If you don't find the answer you're looking for here, feel free to reach out to our customer support team for further assistance.",
              textAlign: TextAlign.justify,
              style: AppTextStyles.h3,
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
