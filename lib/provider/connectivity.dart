import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_string.dart';

class ConnectivityProvider extends ChangeNotifier {
  ConnectivityProvider() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {});
  }
  ConnectivityResult _connectivityResult = ConnectivityResult.none;
  String _svgUrl = AppAssetImagesFile.appinventivLogo;
  String _pageText = AppStrings.notConnectedToNetwork;

  ConnectivityResult get connectivity => _connectivityResult;
  String get svgUrl => _svgUrl;
  String get pageText => _pageText;
  bool isOnline = true;
  void resultHandler(ConnectivityResult result) {
    _connectivityResult = result;
    if (result == ConnectivityResult.none) {
      _svgUrl = AppAssetImagesFile.appinventivLogo;
      isOnline = false;
      _pageText = AppStrings.notConnectedToNetwork;
      notifyListeners();
    } else if (result == ConnectivityResult.mobile) {
      _svgUrl = AppAssetImagesFile.appinventivLogo;
      isOnline = true;
      _pageText = AppStrings.currentlyConnectedToCellularNetwork;
      notifyListeners();
    } else if (result == ConnectivityResult.wifi) {
      _svgUrl = AppAssetImagesFile.appinventivLogo;
      _pageText = AppStrings.connectedToWifi;
      isOnline = true;
      notifyListeners();
    }
    notifyListeners();
  }

  void initialLoad() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    resultHandler(connectivityResult);
  }
}
