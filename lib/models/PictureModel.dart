import 'CustomProperties.dart';

class PictureModel {
  PictureModel({
    this.imageUrl,
    this.thumbImageUrl,
    this.fullSizeImageUrl,
    this.title,
    this.alternateText,
    this.customProperties,
  });

  String? imageUrl;
  String? thumbImageUrl;
  String? fullSizeImageUrl;
  String? title;
  String? alternateText;
  CustomProperties? customProperties;

  factory PictureModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};

    return PictureModel(
      imageUrl: json["ImageUrl"],
      thumbImageUrl: json["ThumbImageUrl"],
      fullSizeImageUrl: json["FullSizeImageUrl"],
      title: json["Title"],
      alternateText: json["AlternateText"],
      customProperties: CustomProperties.fromJson(json["CustomProperties"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "ImageUrl": imageUrl,
        "ThumbImageUrl": thumbImageUrl,
        "FullSizeImageUrl": fullSizeImageUrl,
        "Title": title,
        "AlternateText": alternateText,
        "CustomProperties": customProperties!.toJson(),
      };
}
