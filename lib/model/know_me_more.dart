import 'package:health_group/utils/app_string.dart';

class KnowMeMoreDataModel {
  String? bestWay;
  String? favouriteHobby;
  String? impCharacteristics;
  String? valuedPersonality;
  String? entireWeekend;
  String? loveDoing;
  String? loveShopping;
  String? timeFeels;
  String? oneWord;
  String? likeToDine;
  String? currentProfession;
  String? specialTalent;
  String? peaceWhen;
  String? threeThings;
  String? callMe;
  String? bookMoviePerson;

  KnowMeMoreDataModel(
      {this.bestWay,
      this.favouriteHobby,
      this.impCharacteristics,
      this.valuedPersonality,
      this.entireWeekend,
      this.loveDoing,
      this.loveShopping,
      this.timeFeels,
      this.oneWord,
      this.likeToDine,
      this.currentProfession,
      this.specialTalent,
      this.peaceWhen,
      this.threeThings,
      this.callMe,
      this.bookMoviePerson});

  KnowMeMoreDataModel.fromJson(Map<String, dynamic> json) {
    bestWay = json[AppStrings.bestWay];
    favouriteHobby = json[AppStrings.favouriteHobby];
    impCharacteristics = json[AppStrings.impCharacteristics];
    valuedPersonality = json[AppStrings.valuedPersonality];
    entireWeekend = json[AppStrings.entireWeekend];
    loveDoing = json[AppStrings.loveDoing];
    loveShopping = json[AppStrings.loveShopping];
    timeFeels = json[AppStrings.timeFeels];
    oneWord = json[AppStrings.oneWord];
    likeToDine = json[AppStrings.likeToDine];
    currentProfession = json[AppStrings.currentProfession];
    specialTalent = json[AppStrings.specialTalent];
    peaceWhen = json[AppStrings.peaceWhen];
    threeThings = json[AppStrings.threeThings];
    callMe = json[AppStrings.callMe];
    bookMoviePerson = json[AppStrings.bookMoviePerson];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppStrings.bestWay] = bestWay;
    data[AppStrings.favouriteHobby] = favouriteHobby;
    data[AppStrings.impCharacteristics] = impCharacteristics;
    data[AppStrings.valuedPersonality] = valuedPersonality;
    data[AppStrings.entireWeekend] = entireWeekend;
    data[AppStrings.loveDoing] = loveDoing;
    data[AppStrings.loveShopping] = loveShopping;
    data[AppStrings.timeFeels] = timeFeels;
    data[AppStrings.oneWord] = oneWord;
    data[AppStrings.likeToDine] = likeToDine;
    data[AppStrings.currentProfession] = currentProfession;
    data[AppStrings.specialTalent] = specialTalent;
    data[AppStrings.peaceWhen] = peaceWhen;
    data[AppStrings.threeThings] = threeThings;
    data[AppStrings.callMe] = callMe;
    data[AppStrings.bookMoviePerson] = bookMoviePerson;
    return data;
  }
}
