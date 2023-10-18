import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seoul_select/custom_widgets/ButtonShape.dart';
import 'package:seoul_select/custom_widgets/CustomButton.dart';
import 'package:seoul_select/custom_widgets/ScrollViewWithScrollBar.dart';
import 'package:seoul_select/custom_widgets/custom_appbar2.dart';
import 'package:seoul_select/custom_widgets/quantity_button.dart';
import 'package:seoul_select/features/product_details/image_slider.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';
import '../../theme/src/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // final List<Map<String, String>> productDetailsData = [
  //   {'imageUrl': 'assets/images/image1.jpg'},
  //   {'imageUrl': 'assets/images/image2.jpg'},
  //   {'imageUrl': 'assets/images/image2.jpg'},
  // ];
  final List<String> images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg'
  ];

  int quantity = 1;
  void incrementCount() => setState(() => quantity++);
  void decrementCount() => setState(() => quantity > 1 ? quantity-- : null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar2(
        title: "Ramen",
        automaticallyImplyLeading: true,
      ),
      body: rootView(),
    );
  }

  Widget rootView() {
    return Stack(
      children: [
        ScrollViewWithScrollBar(
          child: Column(
            children: [
              ///image slider
              ProductDetailsImageSlider(
                sliderData: images,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// title and quantity button
                    Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            children: [
                              Text(
                                "Buldak Hot Chicken Flavor Ramen",
                                style: AppTextStyles.h3,
                              ),
                            ],
                          ),
                        ),
                        QuantityButton(
                          quantity: quantity,
                          incrementCallback: () => incrementCount(),
                          decrementCallback: () => decrementCount(),
                        ),
                      ],
                    ),

                    Text(
                      "Origin: Korea",
                      style: AppTextStyles.p10,
                    ),
                    Text(
                      "Brand: Samyang",
                      style: AppTextStyles.p10,
                    ),
                    Text(
                      "Weight: 140g",
                      style: AppTextStyles.p10,
                    ),

                    ///description

                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Description",
                      style: AppTextStyles.p1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Wrap(
                      children: [
                        Text(
                          "Samyang Buldak HOT Chicken Flavor Ramen is a popular choice for spice enthusiasts. It offers a fiery and flavorful experience that ignites the taste buds. With its quick and convenient preparation, Samyang Buldak HOT Chicken Flavor Ramen is satisfying. It is a convenient meal solution for busy individuals seeking a deliciously spicy kick. This budget-friendly ramen option allows versatile customization. It is easy to create a personalized and satisfying bowl of noodles with your favorite toppings and additions.",
                          style: AppTextStyles.p8,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),

                    ///ingredients
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Ingredients",
                      style: AppTextStyles.p1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Wrap(
                      children: [
                        Text(
                          "Wheat flour, palm oil, modified tapioca starch, salt, soybean oil, sugar solution, sweetener, emulsifier, acidity regulator, thickener, color.",
                          style: AppTextStyles.p8,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),

                    ///benefits
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Benefits",
                      style: AppTextStyles.p1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Wrap(
                      children: [
                        Text(
                          "1) Spicy and Flavorful: Samyang Buldak HOT Chicken Flavor Ramen delivers a fiery and tantalizing taste experience. The bold and intense flavors of this ramen variety are perfect for those seeking a deliciously spicy kick in their meals\n\n2) Quick and Convenient: With its easy preparation, this ramen is a convenient option for a quick and satisfying meal. In just a few minutes, you can have a piping hot bowl of noodles ready to enjoy. It is an ideal choice for busy individuals or on-the-go meals\n\n3) Versatile Customization: This ramen allows for versatile customization. It gives you the freedom to personalize your bowl according to your preferences. Add your favorite vegetables, proteins, or toppings to create a unique and satisfying dish tailored to your taste\n\n4) Satisfying Portion Size: This ramen comes in a generous portion size, ensuring you feel satisfied after your meal. It can be a quick lunch or a hearty dinner providing enough noodles and flavors to leave you feeling satiated\n\n5) Budget-Friendly Option: In addition to its taste and convenience, Samyang Buldak HOT Chicken Flavor Ramen is a budget-friendly choice. It offers a delicious and fulfilling meal at an affordable price point. It is an economical option for individuals or families looking for tasty and cost-effective meal solutions.",
                          style: AppTextStyles.p8,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),

                    ///how to cooks
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "How to Cook?",
                      style: AppTextStyles.p1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Wrap(
                      children: [
                        Text(
                          "To enjoy Korean instant mouth-watering Samyang Buldak HOT Chicken Flavor Ramen noodle dish follow the below instruction. You can see also this video.\n\n1) Bring water to a boil in a pot and add the noodles from the Samyang Buldak HOT Chicken Flavor Ramen pack. Cook for 4-5 minutes until they are soft but still slightly firm, stirring occasionally.\n\n2) While the noodles cook, prepare optional toppings such as vegetables, eggs, or cheese.\n\n3) Drain the cooked noodles, reserving about 8-10 tablespoons of the cooking water.\n\n4) Return the drained noodles to the pot and add the seasoning packet(s) and any provided flakes. Mix well until the noodles are evenly coated.\n\n5) Let the flavors meld for a minute or two, then serve the Samyang Buldak HOT Chicken Flavor Ramen with optional toppings for added enjoyment.",
                          style: AppTextStyles.p8,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),

        ///bottomView
        Align(
          alignment: Alignment.bottomCenter,
          child: bottomView(),
        ),
      ],
    );
  }

  Widget bottomView() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: AppColors.textGray,
          width: 0.2,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 6,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Total Price\n',
                        style: AppTextStyles.p10.copyWith(
                          fontSize: 9,
                          color: AppColors.textGray,
                        )),
                    TextSpan(
                        text: '৳ 198.00',
                        style: AppTextStyles.h3.copyWith(
                          height: 1,
                        )),
                  ],
                ),
              ),),
          CustomButton(
            label: "Add to bag",
            backgroundColor: AppColors.primary,
            shape: ButtonShape.Standard,
            svgIcon: SvgPicture.asset(
              "assets/icons/ic_bag2.svg",
            ),
            onClick: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
