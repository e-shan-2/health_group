import 'package:health_group/utils/app_string.dart';

class QuickReplyUpdateDataModel {
  String? old;
  List<String>? newData;
  int? position;

  QuickReplyUpdateDataModel({this.old, this.newData, this.position});

  QuickReplyUpdateDataModel.fromJson(Map<String, dynamic> json) {
    old = json[AppStrings.old];
    newData = json[AppStrings.newData].cast<String>();
    position = json[AppStrings.position];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppStrings.old] = old;
    data[AppStrings.newData] = newData;
    data[AppStrings.position] = position;
    return data;
  }
}
