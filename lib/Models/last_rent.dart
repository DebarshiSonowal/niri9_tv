class LastRentDetails {
  LastRent? lastRent;

  LastRentDetails({this.lastRent});

  LastRentDetails.fromJson(Map<String, dynamic> json) {
    lastRent = json['last_rent'] != null
        ? LastRent.fromJson(json['last_rent'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lastRent != null) {
      data['last_rent'] = this.lastRent!.toJson();
    }
    return data;
  }
}

class LastRent {
  int? id;
  int? videoId;
  String? title;
  String? duration;
  String? basePriceInr;
  String? basePriceUsd;
  String? discount;
  String? totalPriceInr;
  String? totalPriceUsd;
  int? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  String? videoTitle;
  String? videoProfilePic;
  String? activeDate;
  String? expiryDate;

  LastRent(
      {this.id,
        this.videoId,
        this.title,
        this.duration,
        this.basePriceInr,
        this.basePriceUsd,
        this.discount,
        this.totalPriceInr,
        this.totalPriceUsd,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.videoTitle,
        this.videoProfilePic,
        this.activeDate,
        this.expiryDate});

  LastRent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoId = json['video_id'];
    title = json['title'];
    duration = json['duration'];
    basePriceInr = json['base_price_inr'];
    basePriceUsd = json['base_price_usd'];
    discount = json['discount'];
    totalPriceInr = json['total_price_inr'];
    totalPriceUsd = json['total_price_usd'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    videoTitle = json['video_title'];
    videoProfilePic = json['video_profile_pic'];
    activeDate = json['active_date'];
    expiryDate = json['expiry_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video_id'] = this.videoId;
    data['title'] = this.title;
    data['duration'] = this.duration;
    data['base_price_inr'] = this.basePriceInr;
    data['base_price_usd'] = this.basePriceUsd;
    data['discount'] = this.discount;
    data['total_price_inr'] = this.totalPriceInr;
    data['total_price_usd'] = this.totalPriceUsd;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['video_title'] = this.videoTitle;
    data['video_profile_pic'] = this.videoProfilePic;
    data['active_date'] = this.activeDate;
    data['expiry_date'] = this.expiryDate;
    return data;
  }
}
