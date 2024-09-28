class ReviewModel {
  String? reviewerName;
  String? reviewerEmail;
  num? rating;
  String? date;
  String? comment;

  ReviewModel(
      {this.date,
      this.comment,
      this.rating,
      this.reviewerEmail,
      this.reviewerName});

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      comment: json['comment'],
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
      rating: json['rating'],
      date: json['date'],
    );
  }
}

class DimensionsModel {
  num? width;
  num? height;
  num? depth;

  DimensionsModel({this.width, this.height, this.depth});

  factory DimensionsModel.fromJson(Map<String, dynamic> json) {
    return DimensionsModel(
      width: json['width'],
      height: json['height'],
      depth: json['depth'],
    );
  }
}

class MetaModel {
  String? updatedAt;
  String? qrCode;
  String? createdAt;
  String? barcode;

  MetaModel({this.barcode, this.createdAt, this.qrCode, this.updatedAt});

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      barcode: json['barcode'],
      createdAt: json['createdAt'],
      qrCode: json['qrCode'],
      updatedAt: json['updatedAt'],
    );
  }
}

class ProductModel {
  num? weight;
  String? warrantyInformation;
  String? title;
  String? thumbnail;
  List<dynamic>? tags;
  int? stock;
  String? sku;
  String? shippingInformation;
  List<ReviewModel>? reviews;
  String? returnPolicy;
  num? rating;
  num? price;
  int? minimumOrderQuantity;
  MetaModel? meta;
  List<dynamic>? images;
  int? id;
  num? discountPercentage;
  DimensionsModel? dimensions;
  String? description;
  String? category;
  String? brand;
  String? availabilityStatus;

  ProductModel(
      {this.rating,
      this.id,
      this.title,
      this.category,
      this.description,
      this.availabilityStatus,
      this.brand,
      this.dimensions,
      this.discountPercentage,
      this.images,
      this.meta,
      this.minimumOrderQuantity,
      this.price,
      this.returnPolicy,
      this.reviews,
      this.shippingInformation,
      this.sku,
      this.stock,
      this.tags,
      this.thumbnail,
      this.warrantyInformation,
      this.weight});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<ReviewModel> allReview = [];
    for (Map<String, dynamic> eachReview in json['reviews']) {
      allReview.add(ReviewModel.fromJson(eachReview));
    }
    return ProductModel(
        title: json['title'],
        warrantyInformation: json['warrantyInformation'],
        shippingInformation: json['shippingInformation'],
        returnPolicy: json['returnPolicy'],
        price: json['price'],
        minimumOrderQuantity: json['minimumOrderQuantity'],
        discountPercentage: json['discountPercentage'],
        brand: json['brand'],
        availabilityStatus: json['availabilityStatus'],
        description: json['description'],
        category: json['category'],
        id: json['id'],
        rating: json['rating'],
        weight: json['weight'],
        thumbnail: json['thumbnail'],
        stock: json['stock'],
        sku: json['sku'],
        dimensions: DimensionsModel.fromJson(json['dimensions']),
        meta: MetaModel.fromJson(json['meta']),
        images: json['images'],
        tags: json['tags'],
        reviews: allReview);
  }
}

class ProductDataModel {
  List<ProductModel>? products;
  int? total;
  int? skip;
  int? limit;

  ProductDataModel({this.total, this.skip, this.limit, this.products});

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    List<ProductModel> allPro = [];
    for (Map<String, dynamic> eachPro in json['products']) {
      allPro.add(ProductModel.fromJson(eachPro));
    }
    return ProductDataModel(
        limit: json['limit'],
        skip: json['skip'],
        total: json['total'],
        products: allPro);
  }
}
