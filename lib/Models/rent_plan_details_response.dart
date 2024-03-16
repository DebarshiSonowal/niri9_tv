class RentPlanDetailsResponse {
  bool? success;
  RentPlanDetails? result;
  String? message;
  int? code;

  RentPlanDetailsResponse({this.success, this.result, this.message, this.code});

  RentPlanDetailsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    result =
    json['result'] != null ? new RentPlanDetails.fromJson(json['result']) : null;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
  RentPlanDetailsResponse.withError(msg) {
    success = false;
    message = msg;
    // code = json['code'];
  }
}

class RentPlanDetails {
  List<RentPlan>? rentList;
  String? watchTime;
  List<String>? conditions;

  RentPlanDetails({this.rentList, this.watchTime, this.conditions});

  RentPlanDetails.fromJson(Map<String, dynamic> json) {
    if (json['rent_list'] != null) {
      rentList = <RentPlan>[];
      json['rent_list'].forEach((v) {
        rentList!.add(new RentPlan.fromJson(v));
      });
    }
    watchTime = json['watch_time'];
    conditions = json['conditions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rentList != null) {
      data['rent_list'] = this.rentList!.map((v) => v.toJson()).toList();
    }
    data['watch_time'] = this.watchTime;
    data['conditions'] = this.conditions;
    return data;
  }
}

class RentPlan {
  int? id;
  String? title;
  String? duration;
  String? basePriceInr;
  String? basePriceUsd;
  String? discount;
  String? totalPriceInr;
  String? totalPriceUsd;
  String? validityTxt;
  String? watchTimeTxt;

  RentPlan(
      {this.id,
        this.title,
        this.duration,
        this.basePriceInr,
        this.basePriceUsd,
        this.discount,
        this.totalPriceInr,
        this.totalPriceUsd,
        this.validityTxt,
        this.watchTimeTxt});

  RentPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    duration = json['duration'];
    basePriceInr = json['base_price_inr'];
    basePriceUsd = json['base_price_usd'];
    discount = json['discount'];
    totalPriceInr = json['total_price_inr'];
    totalPriceUsd = json['total_price_usd'];
    validityTxt = json['validity_txt'];
    watchTimeTxt = json['watch_time_txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['duration'] = this.duration;
    data['base_price_inr'] = this.basePriceInr;
    data['base_price_usd'] = this.basePriceUsd;
    data['discount'] = this.discount;
    data['total_price_inr'] = this.totalPriceInr;
    data['total_price_usd'] = this.totalPriceUsd;
    data['validity_txt'] = this.validityTxt;
    data['watch_time_txt'] = this.watchTimeTxt;
    return data;
  }
}
