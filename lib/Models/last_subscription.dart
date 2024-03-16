class LastSubscriptionsDetails {
  LastSubscription? lastSubscription;

  LastSubscriptionsDetails({this.lastSubscription});

  LastSubscriptionsDetails.fromJson(Map<String, dynamic> json) {
    lastSubscription = json['last_subscription'] != null
        ? LastSubscription.fromJson(json['last_subscription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.lastSubscription != null) {
      data['last_subscription'] = this.lastSubscription!.toJson();
    }
    return data;
  }
}

class LastSubscription {
  int? id;
  String? title;
  String? planType;
  String? duration;
  String? devicePermissions;
  int? videoQuality;
  int? noOfScreens;
  int? isAdFree;
  String? basePriceInr;
  String? basePriceUsd;
  String? discount;
  String? totalPriceInr;
  String? totalPriceUsd;
  Null? note;
  String? planSection;
  int? isDefault;
  int? status;
  String? createdAt;
  String? updatedAt;

  LastSubscription(
      {this.id,
        this.title,
        this.planType,
        this.duration,
        this.devicePermissions,
        this.videoQuality,
        this.noOfScreens,
        this.isAdFree,
        this.basePriceInr,
        this.basePriceUsd,
        this.discount,
        this.totalPriceInr,
        this.totalPriceUsd,
        this.note,
        this.planSection,
        this.isDefault,
        this.status,
        this.createdAt,
        this.updatedAt});

  LastSubscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    planType = json['plan_type'];
    duration = json['duration'];
    devicePermissions = json['device_permissions'];
    videoQuality = json['video_quality'];
    noOfScreens = json['no_of_screens'];
    isAdFree = json['is_ad_free'];
    basePriceInr = json['base_price_inr'];
    basePriceUsd = json['base_price_usd'];
    discount = json['discount'];
    totalPriceInr = json['total_price_inr'];
    totalPriceUsd = json['total_price_usd'];
    note = json['note'];
    planSection = json['plan_section'];
    isDefault = json['is_default'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['plan_type'] = this.planType;
    data['duration'] = this.duration;
    data['device_permissions'] = this.devicePermissions;
    data['video_quality'] = this.videoQuality;
    data['no_of_screens'] = this.noOfScreens;
    data['is_ad_free'] = this.isAdFree;
    data['base_price_inr'] = this.basePriceInr;
    data['base_price_usd'] = this.basePriceUsd;
    data['discount'] = this.discount;
    data['total_price_inr'] = this.totalPriceInr;
    data['total_price_usd'] = this.totalPriceUsd;
    data['note'] = this.note;
    data['plan_section'] = this.planSection;
    data['is_default'] = this.isDefault;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
