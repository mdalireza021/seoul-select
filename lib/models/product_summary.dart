class ProductSummary {
  String? id;
  String? name;
  String? shortDescription;
  String? fullDescription;
  String? sku;
  bool? allowAddToCart;
  bool? isWishListed;
  bool? isCarted;
  num? ratingAverage;
  ProductSummaryPrice? productPrice;
  bool? markAsNew;
  PictureModel? picture;

  ProductSummary({
    this.id = "",
    this.name = "",
    this.shortDescription = "",
    this.fullDescription = "",
    this.sku = "",
    this.allowAddToCart = false,
    this.isWishListed = false,
    this.isCarted = false,
    this.ratingAverage = 0.0,
    this.productPrice,
    this.markAsNew = false,
    this.picture,
  });
}

class PictureModel {
  String? id;
  String? imageUrl;
  String? thumbImageUrl;
  String? fullSizeImageUrl;
  String? title;
  String? alternateText;
  PictureModel({
    this.id = "",
    this.imageUrl = "",
    this.thumbImageUrl = "",
    this.fullSizeImageUrl = "",
    this.title = "",
    this.alternateText = "",
  });
}

class ProductSummaryPrice {
  String? oldPrice;
  num? oldPriceValue;
  String? price;
  num? priceValue;
  ProductSummaryPrice({
    this.oldPrice = "",
    this.oldPriceValue = 0.0,
    this.price = "",
    this.priceValue = 0.0,
  });
}
