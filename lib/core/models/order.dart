class OrderResponse {
  String? status;
  int? statusCode;
  String? message;
  OrderData? data;

  OrderResponse({this.status, this.statusCode, this.message, this.data});

  OrderResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? new OrderData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class OrderData {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  Null nextPageUrl;
  String? path;
  int? perPage;
  Null prevPageUrl;
  int? to;
  int? total;

  OrderData(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  OrderData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? sellerId;
  String? productId;
  String? status;
  String? orderId;
  String? deliveryType;
  int? quantity;
  String? totalPrice;
  String? deliveryAddress;
  String? deliveryLongitude;
  String? deliveryLatitude;
  String? shippingFee;
  String? additionalInfo;
  Null estimatedDelivery;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  String? durationType;
  Null leaseDuration;
  Null leaseRate;
  Null leaseNotes;
  String? sAccountType;
  Product? product;
  Seller? seller;
  Seller? user;

  Data(
      {this.id,
      this.userId,
      this.sellerId,
      this.productId,
      this.status,
      this.orderId,
      this.deliveryType,
      this.quantity,
      this.totalPrice,
      this.deliveryAddress,
      this.deliveryLongitude,
      this.deliveryLatitude,
      this.shippingFee,
      this.additionalInfo,
      this.estimatedDelivery,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.durationType,
      this.leaseDuration,
      this.leaseRate,
      this.leaseNotes,
      this.sAccountType,
      this.product,
      this.seller,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    sellerId = json['seller_id'];
    productId = json['product_id'];
    status = json['status'];
    orderId = json['order_id'];
    deliveryType = json['delivery_type'];
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    deliveryAddress = json['delivery_address'];
    deliveryLongitude = json['delivery_longitude'];
    deliveryLatitude = json['delivery_latitude'];
    shippingFee = json['shipping_fee'];
    additionalInfo = json['additional_info'];
    estimatedDelivery = json['estimated_delivery'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    durationType = json['duration_type'];
    leaseDuration = json['lease_duration'];
    leaseRate = json['lease_rate'];
    leaseNotes = json['lease_notes'];
    sAccountType = json['_account_type'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    seller =
        json['seller'] != null ? new Seller.fromJson(json['seller']) : null;
    user = json['user'] != null ? new Seller.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['seller_id'] = this.sellerId;
    data['product_id'] = this.productId;
    data['status'] = this.status;
    data['order_id'] = this.orderId;
    data['delivery_type'] = this.deliveryType;
    data['quantity'] = this.quantity;
    data['total_price'] = this.totalPrice;
    data['delivery_address'] = this.deliveryAddress;
    data['delivery_longitude'] = this.deliveryLongitude;
    data['delivery_latitude'] = this.deliveryLatitude;
    data['shipping_fee'] = this.shippingFee;
    data['additional_info'] = this.additionalInfo;
    data['estimated_delivery'] = this.estimatedDelivery;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['duration_type'] = this.durationType;
    data['lease_duration'] = this.leaseDuration;
    data['lease_rate'] = this.leaseRate;
    data['lease_notes'] = this.leaseNotes;
    data['_account_type'] = this.sAccountType;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.seller != null) {
      data['seller'] = this.seller!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? description;
  String? price;
  String? categoryId;
  String? sellerId;
  int? stock;
  String? sku;
  String? productCurrency;
  String? productLocation;
  List<String>? productImage;
  String? weight;
  String? dimensions;
  String? isActive;
  String? isLeasable;
  Null rentablePrice;
  String? productLongitude;
  String? productLatitude;
  String? sAccountType;

  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.categoryId,
      this.sellerId,
      this.stock,
      this.sku,
      this.productCurrency,
      this.productLocation,
      this.productImage,
      this.weight,
      this.dimensions,
      this.isActive,
      this.isLeasable,
      this.rentablePrice,
      this.productLongitude,
      this.productLatitude,
      this.sAccountType});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    categoryId = json['category_id'];
    sellerId = json['seller_id'];
    stock = json['stock'];
    sku = json['sku'];
    productCurrency = json['product_currency'];
    productLocation = json['product_location'];
    productImage = json['product_image'].cast<String>();
    weight = json['weight'];
    dimensions = json['dimensions'];
    isActive = json['is_active'];
    isLeasable = json['is_leasable'];
    rentablePrice = json['rentable_price'];
    productLongitude = json['product_longitude'];
    productLatitude = json['product_latitude'];
    sAccountType = json['_account_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['category_id'] = this.categoryId;
    data['seller_id'] = this.sellerId;
    data['stock'] = this.stock;
    data['sku'] = this.sku;
    data['product_currency'] = this.productCurrency;
    data['product_location'] = this.productLocation;
    data['product_image'] = this.productImage;
    data['weight'] = this.weight;
    data['dimensions'] = this.dimensions;
    data['is_active'] = this.isActive;
    data['is_leasable'] = this.isLeasable;
    data['rentable_price'] = this.rentablePrice;
    data['product_longitude'] = this.productLongitude;
    data['product_latitude'] = this.productLatitude;
    data['_account_type'] = this.sAccountType;
    return data;
  }
}

class Seller {
  String? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? phone;
  Null emailVerifiedAt;
  Null twoFactorConfirmedAt;
  String? twoFactorMethod;
  String? isSocial;
  Null passwordResetCodeExpiresAt;
  String? profilePicture;
  String? accountType;
  String? currentRole;
  Null serviceProviderId;
  Null longitude;
  Null latitude;
  int? isDepartment;
  Null google2faEnabled;
  Null deletedAt;
  Null currentDepartmentId;
  String? mainAccountRole;
  String? subAccountType;
  int? canHoldWallet;
  Null nAccountType;
  int? isGuest;

  Seller(
      {this.id,
      this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.phone,
      this.emailVerifiedAt,
      this.twoFactorConfirmedAt,
      this.twoFactorMethod,
      this.isSocial,
      this.passwordResetCodeExpiresAt,
      this.profilePicture,
      this.accountType,
      this.currentRole,
      this.serviceProviderId,
      this.longitude,
      this.latitude,
      this.isDepartment,
      this.google2faEnabled,
      this.deletedAt,
      this.currentDepartmentId,
      this.mainAccountRole,
      this.subAccountType,
      this.canHoldWallet,
      this.nAccountType,
      this.isGuest});

  Seller.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    twoFactorMethod = json['two_factor_method'];
    isSocial = json['is_social'];
    passwordResetCodeExpiresAt = json['password_reset_code_expires_at'];
    profilePicture = json['profile_picture'];
    accountType = json['account_type'];
    currentRole = json['current_role'];
    serviceProviderId = json['service_provider_id'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    isDepartment = json['is_department'];
    google2faEnabled = json['google2fa_enabled'];
    deletedAt = json['deleted_at'];
    currentDepartmentId = json['current_department_id'];
    mainAccountRole = json['main_account_role'];
    subAccountType = json['sub_account_type'];
    canHoldWallet = json['can_hold_wallet'];
    nAccountType = json['_account_type'];
    isGuest = json['is_guest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['two_factor_confirmed_at'] = this.twoFactorConfirmedAt;
    data['two_factor_method'] = this.twoFactorMethod;
    data['is_social'] = this.isSocial;
    data['password_reset_code_expires_at'] = this.passwordResetCodeExpiresAt;
    data['profile_picture'] = this.profilePicture;
    data['account_type'] = this.accountType;
    data['current_role'] = this.currentRole;
    data['service_provider_id'] = this.serviceProviderId;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['is_department'] = this.isDepartment;
    data['google2fa_enabled'] = this.google2faEnabled;
    data['deleted_at'] = this.deletedAt;
    data['current_department_id'] = this.currentDepartmentId;
    data['main_account_role'] = this.mainAccountRole;
    data['sub_account_type'] = this.subAccountType;
    data['can_hold_wallet'] = this.canHoldWallet;
    data['_account_type'] = this.nAccountType;
    data['is_guest'] = this.isGuest;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  String? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
