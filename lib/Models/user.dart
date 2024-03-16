import 'last_rent.dart';
import 'last_subscription.dart';

class User {
  int? id, mobile;
  String? unique_no, name, email, profile_pic, f_name, l_name, expiry_date;
  bool? has_subscription, last_subscription;
  LastRentDetails? last_rent;
  LastSubscriptionsDetails? last_sub;

  User.fromJson(json) {
    id = json["id"] ?? 0;
    mobile = int.parse("${json["mobile"] ?? "0"}");
    unique_no = json["unique_no"];
    name = json["name"] ?? "NA";
    email = json["email"] ?? "NA";
    profile_pic = json["profile_pic"];
    f_name = json["f_name"] ?? "NA";
    l_name = json["l_name"] ?? "NA";
    expiry_date = json["expiry_date"] ?? "NA";
    has_subscription = json["has_subscription"] ?? false;
    // last_subscription = json["last_subscription"] ?? false;
    last_rent = (json["last_rent"]==false||json['last_rent']==null)?null:LastRentDetails.fromJson(json['last_rent']);
    last_sub = (json["last_subscription"]==false||json["last_subscription"]==null)?null:LastSubscriptionsDetails.fromJson(json);
  }
}

class ProfileResponse {
  bool? success;
  String? message;
  User? user;

  ProfileResponse.fromJson(json) {
    success = json["success"] ?? false;
    message = json["message"] ?? "";
    user = json["result"] == null ? null : User.fromJson(json["result"]);
  }

  ProfileResponse.withError(msg) {
    success = false;
    message = msg;
  }
}
