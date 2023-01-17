import 'package:flutter/material.dart';
import 'package:health_group/utils/app_color.dart';


// ignore: must_be_immutable
class CalenderProject extends StatefulWidget {
  String title;
  CalenderProject({required this.title, Key? key}) : super(key: key);

  @override
  State<CalenderProject> createState() => _CalenderProjectState();
}

class _CalenderProjectState extends State<CalenderProject> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (context, month) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width),
                      child: Table(
                        children: List.generate(
                            6,
                            (week) => TableRow(
                                  children: List.generate(
                                      7,
                                      (day) => CalenderProject(
                                            title: DateTime.now()
                                                .add(Duration(
                                                    days: (month * 42) +
                                                        (week * 7) +
                                                        day))
                                                .day
                                                .toString(),
                                          )),
                                )),
                      ),
                    );
                  }),
            ),

        Container(
          height: 60,
          width: 56,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.veryLightPink),
            color: AppColor.whiteColour,
          ),
          child: Text(widget.title),
        ),
      ],
    );
  }
}
