

class Rent {
  int? id;
  String? title, duration;
  double? base_price_usd,
      base_price_inr,
      discount,
      total_price_inr,
      total_price_usd;

  Rent.fromJson(json) {
    id = int.tryParse("${json["id"] ?? 0}");
    title = json["title"] ?? "";
    duration = json["duration"] ?? "";
    base_price_inr = double.tryParse(json['base_price_inr'] ?? "0");
    base_price_usd = double.tryParse(json['base_price_usd'] ?? "0");
    discount = double.tryParse(json['discount'] ?? "0");
    total_price_inr = double.tryParse(json['total_price_inr'] ?? "0");
    total_price_usd = double.tryParse(json['total_price_usd'] ?? "0");
  }
}
