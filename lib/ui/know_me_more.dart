import 'package:flutter/material.dart';
import 'package:health_group/model/know_me_more.dart';
import 'package:health_group/provider/api_service_provider.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_constants.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';
import 'package:health_group/widget/appbar.dart';
import 'package:health_group/widget/long_button.dart';
import 'package:health_group/widget/textformfield_widget.dart';
import 'package:provider/provider.dart';

class KnowMeMoreClass extends StatefulWidget {
  const KnowMeMoreClass({Key? key}) : super(key: key);

  @override
  State<KnowMeMoreClass> createState() => _KnowMeMoreClassState();
}

enum ButtonState { intialStage, loading, completed }

class _KnowMeMoreClassState extends State<KnowMeMoreClass> {
  late TextEditingController _bestwayToholdControlller;
  late TextEditingController _hobbyController;
  late TextEditingController _imporatantcharacteristicsControlller;
  late TextEditingController _valuedPersonController;
  late TextEditingController _bookImpactController;
  late TextEditingController _myFirendCallMeController;
  late TextEditingController _topofMyBucketController;
  late TextEditingController _iamAtPeaceController;
  late TextEditingController _ifITeacController;
  late TextEditingController _ifIwasNotInCurrentController;
  late TextEditingController _iwouldLikeToDineController;
  late TextEditingController _wordThatBringSmileController;
  late TextEditingController _timeFeelLikeFlyingController;
  late TextEditingController _loveShoppingAtThisStoreTheMostController;
  late TextEditingController _loveDoingWhatIDoBecauseController;
  late TextEditingController _ifIHAdTheEntireWeekendController;
  late List<TextEditingController> _listController;

  @override
  void initState() {
    super.initState();
    _bestwayToholdControlller = TextEditingController();
    _hobbyController = TextEditingController();
    _imporatantcharacteristicsControlller = TextEditingController();
    _valuedPersonController = TextEditingController();
    _bookImpactController = TextEditingController();
    _myFirendCallMeController = TextEditingController();
    _topofMyBucketController = TextEditingController();
    _iamAtPeaceController = TextEditingController();
    _ifITeacController = TextEditingController();
    _ifIwasNotInCurrentController = TextEditingController();
    _iwouldLikeToDineController = TextEditingController();
    _wordThatBringSmileController = TextEditingController();
    _timeFeelLikeFlyingController = TextEditingController();
    _loveShoppingAtThisStoreTheMostController = TextEditingController();
    _loveDoingWhatIDoBecauseController = TextEditingController();
    _ifIHAdTheEntireWeekendController = TextEditingController();

    _listController = [
      _bestwayToholdControlller,
      _hobbyController,
      _imporatantcharacteristicsControlller,
      _valuedPersonController,
      _ifIHAdTheEntireWeekendController,
      _loveDoingWhatIDoBecauseController,
      _loveShoppingAtThisStoreTheMostController,
      _timeFeelLikeFlyingController,
      _wordThatBringSmileController,
      _iwouldLikeToDineController,
      _ifIwasNotInCurrentController,
      _ifITeacController,
      _iamAtPeaceController,
      _topofMyBucketController,
      _myFirendCallMeController,
      _bookImpactController
    ];
  }

  fillvalue(List data) {
    for (int i = 0; i < data.length; i++) {
      if (data[i] == null) {
        _listController[i].text = AppStrings.notAnswered;
      } else {
        _listController[i].text = data[i];
      }
    }
  }

  @override
  void dispose() {
    _bestwayToholdControlller.dispose();
    _hobbyController.dispose();
    _imporatantcharacteristicsControlller.dispose();
    _valuedPersonController.dispose();
    _bookImpactController.dispose();
    _myFirendCallMeController.dispose();
    _topofMyBucketController.dispose();
    _iamAtPeaceController.dispose();
    _ifITeacController.dispose();
    _ifIwasNotInCurrentController.dispose();
    _iwouldLikeToDineController.dispose();
    _wordThatBringSmileController.dispose();
    _timeFeelLikeFlyingController.dispose();
    _loveShoppingAtThisStoreTheMostController.dispose();
    _loveDoingWhatIDoBecauseController.dispose();
    _ifIHAdTheEntireWeekendController.dispose();

    super.dispose();
  }

  final bool _indicator = false;

  ButtonState _state = ButtonState.intialStage;
  @override
  Widget build(BuildContext context) {
    bool _isInit = _indicator || _state == ButtonState.intialStage;
    bool _isDone = _state == ButtonState.completed;
    double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return AppBarClass(
      appBarString: AppStrings.knowMeMore,
      leading: IconButton(
        icon: Image.asset(
          AppAssetImagesFile.backbutton,
          scale: 3,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      widget: FutureBuilder(
          future: Provider.of<ApiServiceProvider>(context, listen: false)
              .getKnowMeMoreProfile(context),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              WidgetsBinding.instance!.addPostFrameCallback((_) async {
                List datavalue = (snapshot.data[AppStrings.data] as Map)
                    .cast<String, dynamic>()
                    .values
                    .toList();
                fillvalue(datavalue);
              });

              return ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.5, vertical: 20),
                children: [
                  Text(
                    AppStrings.bestWayTOGetHold,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  Text(
                    AppStrings.bestwayOptions,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(height: _screenheight * 0.0125),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _bestwayToholdControlller,
                      obscureText: false),
                  SizedBox(
                    height: _screenheight * 0.025,
                  ),
                  Text(
                    AppStrings.myFavouritePastTimeHobby,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(height: _screenheight * 0.0125),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _hobbyController,
                      obscureText: false),
                  SizedBox(
                    height: _screenheight * 0.025,
                  ),
                  Text(
                    AppStrings.theMostImportantCharacteristics,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(
                    height: _screenheight * 0.0125,
                  ),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _imporatantcharacteristicsControlller,
                      obscureText: false),
                  SizedBox(
                    height: _screenheight * 0.025,
                  ),
                  Text(
                    AppStrings.myMostValuedPersonality,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(height: _screenheight * 0.0125),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _valuedPersonController,
                      obscureText: false),
                  SizedBox(
                    height: _screenheight * 0.025,
                  ),
                  Text(
                    AppStrings.ifIHadAnEntire,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(height: _screenheight * 0.0125),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _ifIHAdTheEntireWeekendController,
                      obscureText: false),
                  SizedBox(
                    height: _screenheight * 0.025,
                  ),
                  Text(
                    AppStrings.iLoveDoingWhat,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(height: _screenheight * 0.0125),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _loveDoingWhatIDoBecauseController,
                      obscureText: false),
                  SizedBox(
                    height: _screenheight * 0.025,
                  ),
                  Text(
                    AppStrings.iLoveShoppingAtThisStore,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(height: _screenheight * 0.0125),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _loveShoppingAtThisStoreTheMostController,
                      obscureText: false),
                  SizedBox(
                    height: _screenheight * 0.025,
                  ),
                  Text(
                    AppStrings.theTimeFeelsLikeItIsFlying,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(height: _screenheight * 0.0125),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _timeFeelLikeFlyingController,
                      obscureText: false),
                  SizedBox(
                    height: _screenheight * 0.025,
                  ),
                  Text(
                    AppStrings.oneWordThatCanBringSmile,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(height: _screenheight * 0.0125),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _wordThatBringSmileController,
                      obscureText: false),
                  SizedBox(
                    height: _screenheight * 0.025,
                  ),
                  Text(
                    AppStrings.iLikeToDinwe,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(height: _screenheight * 0.0125),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _iwouldLikeToDineController,
                      obscureText: false),
                  SizedBox(
                    height: _screenheight * 0.025,
                  ),
                  Text(
                    AppStrings.ifNotInMyCurrentProfession,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(height: _screenheight * 0.0125),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _ifIwasNotInCurrentController,
                      obscureText: false),
                  SizedBox(
                    height: _screenheight * 0.025,
                  ),
                  Text(
                    AppStrings.ifIHadToTeach,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(height: _screenheight * 0.0125),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _ifITeacController,
                      obscureText: false),
                  SizedBox(
                    height: _screenheight * 0.025,
                  ),
                  Text(
                    AppStrings.iAmAtPeaceWhen,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(height: _screenheight * 0.0125),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _iamAtPeaceController,
                      obscureText: false),
                  SizedBox(height: _screenheight * 0.0125),
                  Text(
                    AppStrings.theThreeThings,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(height: _screenheight * 0.0125),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _topofMyBucketController,
                      obscureText: false),
                  SizedBox(
                    height: _screenheight * 0.025,
                  ),
                  Text(
                    AppStrings.myFriendsUsuallyCallMe,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(height: _screenheight * 0.0125),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _myFirendCallMeController,
                      obscureText: false),
                  SizedBox(
                    height: _screenheight * 0.025,
                  ),
                  Text(
                    AppStrings.theBookMoviePersonThatHad,
                    style: AppTextStyle.knowMeMOreQuestions,
                  ),
                  SizedBox(height: _screenheight * 0.0125),
                  TextFormFieldClass(
                      enable: true,
                      labelName: "",
                      controller: _bookImpactController,
                      obscureText: false),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: _screenwidth * 0.08,
                        vertical: _screenheight * 0.0562),
                    child: AppButtonClass(
                        buttonColorString: AppColor.whiteColour,
                        width: AppConstants.widthLongButton,
                        height: AppConstants.heightLongButton,
                        buttonColour: AppColor.buttonEnableColour,
                        buttonString: AppStrings.save,
                        isDone: _isDone,
                        isInit: _isInit,
                        onPressed: () async {
                          setState(() {
                            _state = ButtonState.loading;
                          });

                          int i = 0;
                          KnowMeMoreDataModel _datamodel = KnowMeMoreDataModel(
                            bestWay: _listController[i++].text,
                            favouriteHobby: _listController[i++].text,
                            impCharacteristics: _listController[i++].text,
                            valuedPersonality: _listController[i++].text,
                            entireWeekend: _listController[i++].text,
                            loveDoing: _listController[i++].text,
                            loveShopping: _listController[i++].text,
                            timeFeels: _listController[i++].text,
                            oneWord: _listController[i++].text,
                            likeToDine: _listController[i++].text,
                            currentProfession: _listController[i++].text,
                            specialTalent: _listController[i++].text,
                            peaceWhen: _listController[i++].text,
                            threeThings: _listController[i++].text,
                            callMe: _listController[i++].text,
                            bookMoviePerson: _listController[i].text,
                          );
                          Map<String,dynamic>? response;
                          try {
                            response = await Provider.of<ApiServiceProvider>(
                                    context,
                                    listen: false)
                                .patchKnowMeMoreProfile(context,_datamodel);

                            if (200 <= response[AppStrings.statusCode] &&
                                response[AppStrings.statusCode] <= 300) {
                              setState(() {
                                _state = ButtonState.completed;
                              });

                              Navigator.pop(context);
                            } else {
                              setState(() {
                                _state = ButtonState.intialStage;
                              });
                            }
                          } catch (e) {
                            setState(() {
                              _state = ButtonState.intialStage;
                            });
                          }
                          setState(() {
                            _state = ButtonState.intialStage;
                          });
                        },
                        indicator: true),
                  )
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
