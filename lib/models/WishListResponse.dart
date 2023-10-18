
import 'CustomProperties.dart';
import 'PictureModel.dart';

class WishListResponse {
  WishListResponse({
    this.data,
    this.message,
    this.errorList,
  });

  WishListData? data;
  String? message;
  List<String>? errorList;

  factory WishListResponse.fromJson(Map<String, dynamic> json) => WishListResponse(
    data: json["Data"] == null ? null : WishListData.fromJson(json["Data"]),
    message: json["Message"],
    errorList: json["ErrorList"] == null ? null : List<String>.from(json["ErrorList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Data": data == null ? null : data!.toJson(),
    "Message": message,
    "ErrorList": errorList == null ? null : List<dynamic>.from(errorList!.map((x) => x)),
  };
}

class WishListData {
  WishListData({
    this.customerGuid,
    this.customerFullName,
    this.showSku,
    this.showProductImages,
    this.isEditable,
    this.displayAddToCart,
    this.items,
    this.warnings,
    this.customProperties,
  });

  String? customerGuid;
  String? customerFullName;
  bool? showSku;
  bool? showProductImages;
  bool? isEditable;
  bool? displayAddToCart;
  List<WishListItem>? items;
  List<String>? warnings;
  CustomProperties? customProperties;

  factory WishListData.fromJson(Map<String, dynamic> json) => WishListData(
    customerGuid: json["CustomerGuid"],
    customerFullName: json["CustomerFullName"],
    showSku: json["ShowSku"],
    showProductImages: json["ShowProductImages"],
    isEditable: json["IsEditable"],
    displayAddToCart: json["DisplayAddToCart"],
    items: json["Items"] == null ? null : List<WishListItem>.from(json["Items"].map((x) => WishListItem.fromJson(x))),
    warnings: json["Warnings"] == null ? null : List<String>.from(json["Warnings"].map((x) => x)),
    customProperties: json["CustomProperties"] == null ? null : CustomProperties.fromJson(json["CustomProperties"]),
  );

  Map<String, dynamic> toJson() => {
    "CustomerGuid": customerGuid,
    "CustomerFullName": customerFullName,
    "ShowSku": showSku,
    "ShowProductImages": showProductImages,
    "IsEditable": isEditable,
    "DisplayAddToCart": displayAddToCart,
    "Items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toJson())),
    "Warnings": warnings == null ? null : List<dynamic>.from(warnings!.map((x) => x)),
    "CustomProperties": customProperties == null ? null : customProperties!.toJson(),
  };
}

class WishListItem {
  WishListItem({
    this.sku,
    this.picture,
    this.productId,
    this.productName,
    this.productSeName,
    this.unitPrice,
    this.subTotal,
    this.discount,
    this.maximumDiscountedQty,
    this.quantity,
    this.attributeInfo,
    this.recurringInfo,
    this.rentalInfo,
    this.allowItemEditing,
    this.warnings,
    this.id,
    this.customProperties,
  });

  String? sku;
  PictureModel? picture;
  int? productId;
  String? productName;
  String? productSeName;
  String? unitPrice;
  String? subTotal;
  dynamic discount;
  dynamic maximumDiscountedQty;
  int? quantity;
  String? attributeInfo;
  dynamic recurringInfo;
  dynamic rentalInfo;
  bool? allowItemEditing;
  List<String>? warnings;
  int? id;
  CustomProperties? customProperties;

  factory WishListItem.fromJson(Map<String, dynamic> json) => WishListItem(
    sku: json["Sku"],
    picture: json["Picture"] == null ? null : PictureModel.fromJson(json["Picture"]),
    productId: json["ProductId"],
    productName: json["ProductName"],
    productSeName: json["ProductSeName"],
    unitPrice: json["UnitPrice"],
    subTotal: json["SubTotal"],
    discount: json["Discount"],
    maximumDiscountedQty: json["MaximumDiscountedQty"],
    quantity: json["Quantity"],
    attributeInfo: json["AttributeInfo"],
    recurringInfo: json["RecurringInfo"],
    rentalInfo: json["RentalInfo"],
    allowItemEditing: json["AllowItemEditing"],
    warnings: json["Warnings"] == null ? null : List<String>.from(json["Warnings"].map((x) => x)),
    id: json["Id"],
    customProperties: json["CustomProperties"] == null ? null : CustomProperties.fromJson(json["CustomProperties"]),
  );

  Map<String, dynamic> toJson() => {
    "Sku": sku,
    "Picture": picture == null ? null : picture!.toJson(),
    "ProductId": productId,
    "ProductName": productName,
    "ProductSeName": productSeName,
    "UnitPrice": unitPrice,
    "SubTotal": subTotal,
    "Discount": discount,
    "MaximumDiscountedQty": maximumDiscountedQty,
    "Quantity": quantity,
    "AttributeInfo": attributeInfo,
    "RecurringInfo": recurringInfo,
    "RentalInfo": rentalInfo,
    "AllowItemEditing": allowItemEditing,
    "Warnings": warnings == null ? null : List<dynamic>.from(warnings!.map((x) => x)),
    "Id": id,
    "CustomProperties": customProperties == null ? null : customProperties!.toJson(),
  };
}
