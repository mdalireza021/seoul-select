import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppIcons {
  /// Check if the icon is SVG
  static bool _isSvg(String path) => path.contains('svg');

  /// Return the icon accordingly
  static Widget icon(
    String path, {
    double size = sizeSmall,
    Color? color,
  }) {
    if (_isSvg(path)) {
      return SvgPicture.asset(
        path,
        width: size,
        height: size,
        color: color,
      );
    } else {
      return Image.asset(
        path,
        width: size,
        height: size,
      );
    }
  }

  static const _kFontFam = 'SeoulSelect';
  static const String? _kFontPkg = null;

  static const IconData idTrashBean = IconData(
    0xe800,
    fontFamily: _kFontFam,
    fontPackage: _kFontPkg,
  );

  static const IconData icBackArrow = IconData(
    0xe801,
    fontFamily: _kFontFam,
    fontPackage: _kFontPkg,
  );

  /// Constants
  static const double sizeXSmall = 15;
  static const double sizeSmall = 22;
  static const double sizeMedium = 35;
  static const double sizeLarge = 80;

  static const String icHome = 'assets/icons/ic_home.svg';
  static const String icWishlist = 'assets/icons/ic_wishlist.svg';
  static const String icBag = 'assets/icons/ic_bag.svg';
  static const String icBag2 = 'assets/icons/ic_bag2.svg';
  static const String icMore = 'assets/icons/ic_more.svg';


  static const String icCancel = 'assets/icons/ic_cancel.svg';

  static const String icLogo = 'assets/icons/ic_logo.svg';
  static const String icFilter = 'assets/icons/filter.svg';

  static const String icPerson = 'assets/icons/ic_person.svg';
  static const String icMyFavourites = 'assets/icons/ic_my_favourites.svg';
  static const String icMyOrder = 'assets/icons/ic_my_order.svg';

  static const String icSearch = 'assets/icons/ic_search.svg';
  static const String icShippingAddress = 'assets/icons/ic_shipping_address.svg';
  static const String icMyCard = 'assets/icons/ic_my_card.svg';
  static const String icSettings = 'assets/icons/ic_settings.svg';

  static const String icFAQ = 'assets/icons/ic_faq.svg';
  static const String icPrivacy = 'assets/icons/ic_privacy.svg';
  static const String icAboutUs= 'assets/icons/ic_about_us.svg';

  static const String icSignOut= 'assets/icons/ic_signout.svg';
}
