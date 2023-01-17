import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:health_group/provider/connectivity.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ConnectivityCheck extends StatefulWidget {
  const ConnectivityCheck({Key? key}) : super(key: key);

  @override
  State<ConnectivityCheck> createState() => _ConnectivityCheckState();
}

class _ConnectivityCheckState extends State<ConnectivityCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Consumer<ConnectivityProvider>(
          builder: (context, _connectivityProvider, child) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
                child: Image.asset(_connectivityProvider.svgUrl,
                    fit: BoxFit.contain)),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 20, 30, 100),
                child: Text(
                  _connectivityProvider.pageText,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (_connectivityProvider.connectivity != ConnectivityResult.wifi)
              Flexible(
                child: ElevatedButton(
                  child: Text(AppStrings.openSetting),
                  onPressed: () => openAppSettings(),
                ),
              )
          ],
        );
      }),
    ));
  }
}
