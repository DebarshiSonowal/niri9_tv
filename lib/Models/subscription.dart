// import 'package:niri9/Models/display_data.dart';

import 'display_data.dart';

class Subscription {
  int? id, is_default;
  String? title, plan_type, plan_type_short;
  double? discount,
      base_price_inr,
      base_price_usd,
      total_price_inr,
      total_price_usd;
  DisplayData? displayData;

  Subscription.fromJson(json) {
    id = json["id"] ?? 0;
    is_default = json["is_default"] ?? 0;
    //String
    title = json["title"] ?? "";
    plan_type = json["plan_type"] ?? "";
    plan_type_short = json["plan_type_short"] ?? "";
    //double
    discount = double.tryParse(json["discount"] ?? "0");
    base_price_inr = double.tryParse(json["base_price_inr"] ?? "0");
    base_price_usd = double.tryParse(json["base_price_usd"] ?? "0");
    total_price_inr = double.tryParse(json["total_price_inr"] ?? "0");
    total_price_usd = double.tryParse(json["total_price_usd"] ?? "0");
    displayData = json['display_data'] == null
        ? null
        : DisplayData.fromJson(json['display_data']);
  }
}

class SubscriptionResponse {
  bool? success;
  String? message;
  List<Subscription> subscriptions = [];

  SubscriptionResponse.fromJson(json) {
    success = json['success'] ?? true;
    message = json['message'] ?? "Something went wrong";
    subscriptions = json['result'] == null
        ? []
        : (json['result'] as List)
            .map((e) => Subscription.fromJson(e))
            .toList();
  }
  SubscriptionResponse.withError(msg){
    success = false;
    message = msg;
  }
}
