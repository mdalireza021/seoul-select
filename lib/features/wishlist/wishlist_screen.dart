import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seoul_select/custom_widgets/CustomButton.dart';
import 'package:seoul_select/custom_widgets/ScrollViewWithScrollBar.dart';
import 'package:seoul_select/custom_widgets/custom_appbar.dart';
import 'package:seoul_select/custom_widgets/search_box.dart';
import 'package:seoul_select/features/wishlist/wishlist_item.dart';
import 'package:seoul_select/theme/src/app_icons.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';
import '../../models/Product.dart';
import '../../theme/src/app_colors.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Product> products = [
    Product(
      id: 1,
      title: "Shin Kimchi Ramen 120gm",
      imgUrl: "assets/images/kimchi.png",
      origin: "Korea",
      quantity: 1,
      price: 198,
    ),
    Product(
      id: 2,
      title: "Bibigo Kimbap Kim 20gm",
      imgUrl: "assets/images/bibigo-kimpap-kim.png",
      origin: "Korea",
      quantity: 1,
      price: 240,
    ),
    Product(
      id: 3,
      title: "Shrimp Flavoured Chips 75gm",
      imgUrl: "assets/images/shrimp-flavoured-chips.png",
      origin: "Korea",
      quantity: 1,
      price: 200,
    ),
    Product(
      id: 4,
      title: "Fresh Udon 200gm",
      imgUrl: "assets/images/samlip-fresh-udon.png",
      origin: "Korea",
      quantity: 1,
      price: 145,
    ),
  ];

  void _showPopupDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Column(
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.black,
                size: 40.0,
              ),
              const SizedBox(height: 8.0),
              Text(
                'Added to Bag',
                style: AppTextStyles.p1.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: const Text('1 item was added to the bag.'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  _deleteItem(int index) {
    setState(() {
      _showPopupDialog(context);
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: products.isEmpty ? emptyView() : rootView(),
    );
  }

  Widget rootView() {
    return Column(
      //padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: SearchBox(
            controller: _searchController,
            onTextChanged: (value) => null,
            onClick: () {
              print("click search button");
            },
          ),
        ),
        const SizedBox(height: 15),
        ScrollViewWithScrollBar(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: WishListItem(
                  productItem: products[index],
                  onPress: () => _deleteItem(index),
                  onCancel: () => _deleteItem(index),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget emptyView() {
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
          const SizedBox(height: 5),
          Text(
            "Empty WishList",
            style: AppTextStyles.h3.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
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
                  backgroundColor: AppColors.primary,
                  onClick: () {},
                ),
              ),
              const Expanded(
                flex: 3,
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
