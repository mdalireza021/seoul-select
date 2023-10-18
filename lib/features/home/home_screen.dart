import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seoul_select/custom_widgets/ScrollViewWithScrollBar.dart';
import 'package:seoul_select/custom_widgets/custom_appbar.dart';
import 'package:seoul_select/custom_widgets/custom_banner.dart';
import 'package:seoul_select/custom_widgets/product_box.dart';
import 'package:seoul_select/custom_widgets/search_box.dart';
import 'package:seoul_select/features/home/filter_drawer.dart';
import 'package:seoul_select/features/product_details/product_details_screen.dart';
import 'package:seoul_select/theme/src/app_colors.dart';
import 'package:seoul_select/theme/src/app_text_styles.dart';
import '../../utils/Const.dart';
import '../menu/local/privacy_policy_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

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

  void _showSnackBar(Function() onPress) {
    var snackBar = SnackBar(
      action: SnackBarAction(
        label: "Show",
        textColor: AppColors.textGray2,
        onPressed: () => onPress.call(),
      ),
      backgroundColor: AppColors.primary,
      elevation: 100,
      content: Text(
        'Added to Wishlist',
        style: AppTextStyles.p6.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: const CustomAppBar(),
      body: ScrollViewWithScrollBar(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          color: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// SearchBox
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: SearchBox(
                        controller: _searchController,
                        onTextChanged: (text) {
                          setState(() {
                            _searchText = text;
                          });
                        },
                        onClick: () => null,
                      ),
                    ),
                  ),
                ],
              ),

              /// banner
              SizedBox(
                height: 180.0,
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                      child: Material(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(8),

                        child: const ImageContainerWithTextButton(),
                        // child: Container(
                        //   width: MediaQuery.of(context).size.width * 0.7,
                        //   decoration: const BoxDecoration(
                        //     color: Color(0xFFB9BDCC),
                        //   ),
                        //   child: Image.asset("assets/images/bannar3.jpg", fit: BoxFit.fill,),
                        // ),
                      ),
                    );
                  },
                ),
              ),

              /// New Products
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Const.newProducts,
                    style: AppTextStyles.h3,
                  ),
                  viewAllWidget(() {
                    print("click view all from new products");
                  }),
                  // Material(
                  //   color: AppColors.white,
                  //   clipBehavior: Clip.hardEdge,
                  //   borderRadius: BorderRadius.circular(3),
                  //   child: InkWell(
                  //     onTap: () => {},
                  //     child: Padding(
                  //       padding: const EdgeInsets.fromLTRB(5,5,8,5),
                  //       child: Text(
                  //         Const.viewAll,
                  //         style: AppTextStyles.p10.copyWith(
                  //           height: 1.50,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 8, 5),
                      child: ProductBox(
                        onClick: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProductDetailsScreen(),

                            //builder: (context) => const PrivacyPolicy(),
                          ),
                        ),
                        onAddToCartTapped: (value) {
                          _showPopupDialog(context);
                        },
                        onWishListTapped: (value) => _showSnackBar(() => {}),
                      ),
                    );
                  },
                ),
              ),

              /// Best Sell
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Const.bestSell,
                    style: AppTextStyles.h3,
                  ),
                  viewAllWidget(() {
                    print("click view all from best sell");
                  }),
                ],
              ),

              SizedBox(
                height: 240,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 8, 5),
                      child: ProductBox(
                        onClick: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProductDetailsScreen(),
                          ),
                        ),
                        onAddToCartTapped: (value) {
                          _showPopupDialog(context);
                        },
                        onWishListTapped: (value) => _showSnackBar(() => {}),
                      ),
                    );
                  },
                ),
              ),

              /// k beauty
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Const.kBeauty,
                    style: AppTextStyles.h3,
                  ),
                  viewAllWidget(() {
                    print("click view all from k beauty");
                  }),
                ],
              ),

              SizedBox(
                height: 240,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 8, 5),
                      child: ProductBox(
                        onClick: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProductDetailsScreen(),
                          ),
                        ),
                        onAddToCartTapped: (value) {
                          _showPopupDialog(context);
                        },
                        onWishListTapped: (value) => _showSnackBar(() => {}),
                      ),
                    );
                  },
                ),
              ),

              /// k food
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Const.kFood,
                    style: AppTextStyles.h3,
                  ),
                  viewAllWidget(() {
                    print("click view all from k food");
                  }),
                ],
              ),

              SizedBox(
                height: 240,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 8, 5),
                      child: ProductBox(
                        onClick: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProductDetailsScreen(),
                          ),
                        ),
                        onAddToCartTapped: (value) {
                          _showPopupDialog(context);
                        },
                        onWishListTapped: (value) => _showSnackBar(() => {}),
                      ),
                    );
                  },
                ),
              ),

              /// k health
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Const.kHealth,
                    style: AppTextStyles.h3,
                  ),
                  viewAllWidget(() {
                    print("click view all from k health");
                  }),
                ],
              ),

              SizedBox(
                height: 240,
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 8, 5),
                      child: ProductBox(
                        onClick: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ProductDetailsScreen(),
                          ),
                        ),
                        onAddToCartTapped: (value) {
                          _showPopupDialog(context);
                        },
                        onWishListTapped: (value) => _showSnackBar(() => {}),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: const FractionallySizedBox(
        widthFactor: 0.7,
        child: Drawer(
          child: FilterDrawer(),
        ),
      ),
    );
  }

  /// view all button
  Widget viewAllWidget(Function onTap) {
    return Material(
      clipBehavior: Clip.hardEdge,
      color: AppColors.white,
      borderRadius: BorderRadius.circular(3),
      child: InkWell(
        onTap: () => onTap.call(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 8, 5),
          child: Text(
            Const.viewAll,
            style: AppTextStyles.p10.copyWith(
              height: 1.50,
            ),
          ),
        ),
      ),
    );
  }
}
