abstract class BaseAppImages {
  String imagesPath = '';
  String networkImagesPath = '';
}

class AppImages extends BaseAppImages {
  factory AppImages() => instance;
  AppImages._();
  static AppImages instance = AppImages._();

  @override
  String get imagesPath => 'assets/images';

  @override
  String get networkImagesPath => 'https://image.org/t/p/w500/';

  /// Local assets
  String get update_profile_bg => '$imagesPath/profile-bg.png';
  String get profile_bg => '$imagesPath/profile-bg.png';
  String get profile_footer => '$imagesPath/profile-footer.png';
  String get cancel => '$imagesPath/cancel.png';
}
