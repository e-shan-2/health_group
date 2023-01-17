import 'package:health_group/utils/app_string.dart';

class QuickReplyDataModel {
  String? msg;

  QuickReplyDataModel({this.msg});

  QuickReplyDataModel.fromJson(Map<String, dynamic> json) {
    msg = json[AppStrings.message];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppStrings.message] = msg;
    return data;
  }
}
