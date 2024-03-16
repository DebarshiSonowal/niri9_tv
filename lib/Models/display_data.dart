// import 'package:niri9/Models/generic_item.dart';

import 'generic_item.dart';

class DisplayData {
  GenericItemBool? mso, watch_tv, ad;
  GenericItemString? quality;
  GenericItemInt? screens;

  DisplayData.fromJson(json) {
    mso = json['mso'] == null ? null : GenericItemBool.fromJson(json['mso']);
    watch_tv = json['watch_tv'] == null
        ? null
        : GenericItemBool.fromJson(json['watch_tv']);
    ad = json['ad'] == null ? null : GenericItemBool.fromJson(json['ad']);
    quality = json['quality'] == null
        ? null
        : GenericItemString.fromJson(json['quality']);
    screens = json['screens'] == null
        ? null
        : GenericItemInt.fromJson(json['screens']);
  }
}
