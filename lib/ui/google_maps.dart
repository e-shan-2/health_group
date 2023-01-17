import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  State<GoogleMaps> createState() => _GoogleMapsState();
}

int i = 0;
List<int> days = [];
DateTime? _selectedDay;
DateTime _focusedDay = DateTime.now();

class _GoogleMapsState extends State<GoogleMaps> {
  static const LatLng _centre = LatLng(28.6061, 77.3619);
//  DateFormat.yM(locale).format(date),
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          // padding: EdgeInsets.all(30),
          children: [
            Stack(alignment: Alignment.topLeft, children: [
              TableCalendar(
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay =
                        focusedDay; // update `_focusedDay` here as well
                  });
                },
                headerStyle: HeaderStyle(
                    headerPadding: const EdgeInsets.all(20),
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                    formatButtonShowsNext: false,
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        color: AppColor.whiteColour),
                    titleTextFormatter: (date, locale) =>
                        DateFormat('EEEEE, MMM d, ' 'yyyy').format(date),
                    decoration: const BoxDecoration(
                      color: AppColor.buttonEnableColour,
                    )),
                daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: AppColor.whiteColour),
                    weekendStyle: TextStyle(color: AppColor.whiteColour),
                    decoration:
                        BoxDecoration(color: AppColor.buttonEnableColour)),
                calendarFormat: CalendarFormat.week,
                calendarStyle: const CalendarStyle(
                  selectedDecoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.whiteColour),
                  todayTextStyle: TextStyle(color: AppColor.buttonEnableColour),
                  selectedTextStyle:
                      TextStyle(color: AppColor.buttonEnableColour),
                  todayDecoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.whiteColour),
                  weekendTextStyle: TextStyle(color: AppColor.whiteColour),
                  defaultTextStyle: TextStyle(color: AppColor.whiteColour),
                  rowDecoration:
                      BoxDecoration(color: AppColor.buttonEnableColour),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    AppAssetImagesFile.backbutton,
                    height: 20,
                    color: AppColor.whiteColour,
                  ),
                ),
              )
            ]),
            const Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _centre,
                  zoom: 10.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
