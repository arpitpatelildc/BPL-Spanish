
class UserProfileModel {
  int? statusCode;
  String? message;
  Data? data;

  UserProfileModel({this.statusCode, this.message, this.data});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  int? platform;
  String? subscriptionPlatform;
  String? stripeId;
  bool? status;
  bool? isPurchase;
  String? purchaseDate;
  String? firebaseUserId;
  String? fcmToken;
  String? androidAppVersion;
  String? iosAppVersion;
  String? lastLoginTimestamp;
  String? clientId;

  Data(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.mobile,
        this.platform,
        this.subscriptionPlatform,
        this.stripeId,
        this.status,
        this.isPurchase,
        this.purchaseDate,
        this.firebaseUserId,
        this.fcmToken,
        this.androidAppVersion,
        this.iosAppVersion,
        this.lastLoginTimestamp,
        this.clientId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'] ?? '';
    platform = json['platform'];
    subscriptionPlatform = json['subscription_platform'] ?? '';
    stripeId = json['stripe_id'] ?? '';
    status = json['status'] ?? '';
    isPurchase = json['is_purchase'];
    purchaseDate = json['purchase_date'];
    firebaseUserId = json['firebase_user_id'] ?? '';
    fcmToken = json['fcm_token'];
    androidAppVersion = json['android_app_version'];
    iosAppVersion = json['ios_app_version'];
    lastLoginTimestamp = json['last_login_timestamp'];
    clientId = json['client_id'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['platform'] = this.platform;
    data['subscription_platform'] = this.subscriptionPlatform;
    data['stripe_id'] = this.stripeId;
    data['status'] = this.status;
    data['is_purchase'] = this.isPurchase;
    data['purchase_date'] = this.purchaseDate;
    data['firebase_user_id'] = this.firebaseUserId;
    data['fcm_token'] = this.fcmToken;
    data['android_app_version'] = this.androidAppVersion;
    data['ios_app_version'] = this.iosAppVersion;
    data['last_login_timestamp'] = this.lastLoginTimestamp;
    data['client_id'] = this.clientId;
    return data;
  }
}
