import 'package:flutter/material.dart';


import 'package:health_group/ui/alert_sceen.dart';

import 'package:health_group/ui/home.dart';
import 'package:health_group/ui/matched.dart';

import 'package:health_group/ui/settings_ui.dart';
import 'package:health_group/utils/app_color.dart';


class TabBarClass extends StatefulWidget {
  const TabBarClass({
    Key? key,
  }) : super(key: key);

  @override
  State<TabBarClass> createState() => _TabBarClassState();
}

class _TabBarClassState extends State<TabBarClass> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: menu(),
        body: const TabBarView(children: [
          HomePage(
            
          ),
          MAtchedText(),
          AlertScrenn(),
          Settings(),
        ]),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: Colors.white,
      child: const TabBar(
        labelColor: AppColor.buttonEnableColour,
        unselectedLabelColor: Color.fromARGB(255, 89, 88, 88),

        indicatorSize: TabBarIndicatorSize.tab,
        // indicatorPadding: const EdgeInsets.all(5.0),
        indicatorColor: Colors.transparent,

        tabs: [
          Tab(icon: Icon(Icons.message)),
          Tab(
              icon: Icon(
            Icons.call,
          )),
          Tab(
            icon: Icon(
              Icons.notifications,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
    );
  }
}
