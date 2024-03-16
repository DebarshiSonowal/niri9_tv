// "name": "Razorpay",
//             "active_mode": "live",
//             "api_key": "rzp_live_iQ7sh3ZRzuy1u9",
//             "secret_key": "jMpgLbygk3LidMcKkrq0zGJ6",
//             "is_active": "1"
class PaymentGateway {
  String? name, active_mode, secret_key, api_key;
  int? is_active;

  PaymentGateway.fromJson(json) {
    name = json['name'] ?? "";
    active_mode = json['active_mode'] ?? "";
    secret_key = json['secret_key'] ?? "";
    api_key = json['api_key'] ?? "";
    is_active = int.parse("${json['is_active'] ?? "0"}");
  }
}

class PaymentGatewayResponse {
  bool? success;
  String? message;
  PaymentGateway? razorpay, easebuzz;

  PaymentGatewayResponse.fromJson(json) {
    success = json['success'] ?? false;
    message = json['message'] ?? "Something went wrong";
    razorpay = json['rz'] == null ? null : PaymentGateway.fromJson(json['rz']);
    easebuzz =
        json['ebuzz'] == null ? null : PaymentGateway.fromJson(json['ebuzz']);
  }

  PaymentGatewayResponse.withError(msg){
    success = false;
    message = msg??"Something went wrong";
  }

}
