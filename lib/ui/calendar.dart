import 'package:flutter/material.dart';
import 'package:health_group/model/events.dart';
import 'package:health_group/provider/app_form_provider.dart';
import 'package:health_group/utils/app_asset_images.dart';
import 'package:health_group/utils/app_color.dart';
import 'package:health_group/utils/app_routes.dart';
import 'package:health_group/utils/app_string.dart';
import 'package:health_group/utils/app_text_style.dart';
import 'package:health_group/widget/small_button_popup.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomTableCalendar extends StatefulWidget {
  const CustomTableCalendar({Key? key}) : super(key: key);

  @override
  _CustomTableCalendarState createState() => _CustomTableCalendarState();
}

enum CalendarFormating { week, month }

class _CustomTableCalendarState extends State<CustomTableCalendar> {
  final todaysDate = DateTime.now();
  var _focusedCalendarDate = DateTime.now();
  final _initialCalendarDate = DateTime(2000);
  final _lastCalendarDate = DateTime(2050);
  DateTime? selectedCalendarDate;
  final titleController = TextEditingController();
  final descpController = TextEditingController();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  late Map<DateTime, List<MyEvents>> mySelectedEvents;
  bool _colourMonth = true;
  bool _colourWeek = false;
  bool _colourCompleted = true;
  bool _colourProjected = false;
  bool expand = true;

  @override
  void initState() {
    selectedCalendarDate = _focusedCalendarDate;
    mySelectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descpController.dispose();
    super.dispose();
  }

  List<MyEvents> _listOfDayEvents(DateTime dateTime) {
    return mySelectedEvents[dateTime] ?? [];
  }

  _showAddEventDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(AppStrings.newEvent),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildTextField(
                      controller: titleController,
                      hint: AppStrings.enterTitile),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildTextField(
                      controller: descpController,
                      hint: AppStrings.enterDescription),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(AppStrings.cancel),
                ),
                TextButton(
                  onPressed: () {
                    if (titleController.text.isEmpty &&
                        descpController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppStrings.titleDescription),
                          duration: const Duration(seconds: 3),
                        ),
                      );

                      return;
                    } else {
                      setState(() {
                        if (mySelectedEvents[selectedCalendarDate] != null) {
                          mySelectedEvents[selectedCalendarDate]?.add(MyEvents(
                              eventTitle: titleController.text,
                              eventDescp: descpController.text));
                        } else {
                          mySelectedEvents[selectedCalendarDate!] = [
                            MyEvents(
                                eventTitle: titleController.text,
                                eventDescp: descpController.text)
                          ];
                        }
                      });

                      titleController.clear();
                      descpController.clear();

                      Navigator.pop(context);
                      return;
                    }
                  },
                  child: Text(AppStrings.add),
                ),
              ],
            ));
  }

  Widget buildTextField(
      {String? hint, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        labelText: hint ?? '',
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.redColor, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColor.redColor, width: 1.5),
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
    );
  }

  void onFormatChanging(CalendarFormat data) {
    setState(() {
      _calendarFormat = data;
    });
  }

  CalendarFormat formatMonth = CalendarFormat.month;
  CalendarFormat formatWeek = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    double _screenwidth = MediaQuery.of(context).size.width;
    double _screenheight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showAddEventDialog();
          },
          label: Text(AppStrings.addEvent),
        ),
        body: SingleChildScrollView(
          child: Consumer<AppFormProvider>(
            builder: (context, _providerAppForm, child) {
              return Column(
                children: [
                  Container(
                    height: _screenheight * 0.12,
                    color: AppColor.bluish,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Image.asset(
                            AppAssetImagesFile.backbutton,
                            color: AppColor.whiteColour,
                            scale: 3,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          AppStrings.myCalender,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0),
                        ),
                        const Spacer(),
                        SmallButtonPopUp(
                            buttonSize: Size(
                                _screenwidth * 0.2, _screenheight * 0.0465),
                            appColor: _colourCompleted
                                ? AppColor.whiteColour
                                : AppColor.niceBlue,
                            onPressed: () {
                              setState(() {
                                _colourCompleted = true;
                                _colourProjected = false;
                              });
                            },
                            buttonString: AppStrings.completed),
                        SmallButtonPopUp(
                            buttonSize: Size(
                                _screenwidth * 0.2, _screenheight * 0.0465),
                            appColor: _colourProjected
                                ? AppColor.whiteColour
                                : AppColor.niceBlue,
                            onPressed: () {
                              setState(() {
                                _colourCompleted = false;
                                _colourProjected = true;
                              });
                            },
                            buttonString: AppStrings.projected),
                        const Spacer(),
                        IconButton(
                          icon: Image.asset(AppAssetImagesFile.location),
                          onPressed: () {
                            Navigator.pushNamed(context, Routing.googleMap);
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                  Card(
                    child: TableCalendar(
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
                        weekendStyle: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      focusedDay: _focusedCalendarDate,
                      firstDay: _initialCalendarDate,
                      lastDay: _lastCalendarDate,
                      calendarFormat: _calendarFormat,
                      availableCalendarFormats: {
                        CalendarFormat.month: AppStrings.month,
                        CalendarFormat.week: AppStrings.week,
                      },
                      weekendDays: const [DateTime.sunday, 6],
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      daysOfWeekHeight: _screenheight * 0.06,
                      rowHeight: _screenheight * 0.106,
                      eventLoader: _listOfDayEvents,
                      headerStyle: HeaderStyle(
                        headerPadding: const EdgeInsets.only(left: 20),
                        formatButtonVisible: true,
                        titleTextStyle: const TextStyle(
                          color: AppColor.blackColour,
                          fontSize: 20.0,
                        ),
                        titleCentered: true,
                        decoration: const BoxDecoration(
                          color: AppColor.veryLightPink,
                        ),
                        leftChevronVisible: true,
                        rightChevronVisible: false,
                        leftChevronIcon: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            alignment: Alignment.topLeft,
                            height: _screenheight * 0.063,
                            decoration: const BoxDecoration(
                                color: AppColor.veryLightPinkThree,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Row(children: [
                              SmallButtonPopUp(
                                  buttonSize: Size(_screenwidth * 0.165,
                                      _screenheight * 0.0465),
                                  appColor: _colourMonth
                                      ? AppColor.whiteColour
                                      : AppColor.veryLightPinkThree,
                                  onPressed: () {
                                    setState(() {
                                      expand = true;
                                      _colourMonth = true;
                                      _colourWeek = false;
                                    });
                                    onFormatChanging(formatMonth);
                                  },
                                  buttonString: AppStrings.month),
                              SmallButtonPopUp(
                                  buttonSize: Size(_screenwidth * 0.165,
                                      _screenheight * 0.0465),
                                  appColor: _colourWeek
                                      ? AppColor.whiteColour
                                      : AppColor.veryLightPinkThree,
                                  onPressed: () {
                                    setState(() {
                                      expand = false;
                                      _colourMonth = false;
                                      _colourWeek = true;
                                    });
                                    onFormatChanging(formatWeek);
                                  },
                                  buttonString: AppStrings.week),
                            ]),
                          ),
                        ),
                      ),
                      calendarStyle: CalendarStyle(
                        weekendDecoration: BoxDecoration(
                            border: Border.all(
                                width: 0.1, color: AppColor.blackColour)),
                        defaultTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        outsideDecoration: BoxDecoration(
                            border: Border.all(
                                width: 0.1, color: AppColor.blackColour)),
                        cellMargin: const EdgeInsets.all(0),
                        defaultDecoration: BoxDecoration(
                            border: Border.all(
                                width: 0.1, color: AppColor.blackColour)),
                        weekendTextStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.blackColour),
                        todayDecoration: BoxDecoration(
                          color: AppColor.buttonEnableColour,
                          border: Border.all(
                              color: AppColor.whiteColour, width: 10),
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: AppColor.buttonEnableColour,
                          border:
                              Border.all(color: AppColor.whiteColour, width: 8),
                          shape: BoxShape.circle,
                        ),
                        markerDecoration: const BoxDecoration(
                            color: AppColor.buttonEnableColour,
                            shape: BoxShape.rectangle),
                      ),
                      selectedDayPredicate: (currentSelectedDate) {
                        return (isSameDay(
                            selectedCalendarDate!, currentSelectedDate));
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(selectedCalendarDate, selectedDay)) {
                          setState(() {
                            selectedCalendarDate = selectedDay;
                            _focusedCalendarDate = focusedDay;
                          });
                        }
                      },
                    ),
                  ),
                  Container(
                    height: _screenheight * 0.06,
                    decoration: const BoxDecoration(shape: BoxShape.rectangle),
                    child: expand
                        ? IconButton(
                            icon: const Icon(
                              Icons.expand_less_outlined,
                              size: 40,
                            ),
                            onPressed: () {
                              onFormatChanging(formatWeek);
                              setState(() {
                                expand = false;
                                _colourMonth = false;
                                _colourWeek = true;
                              });
                            },
                          )
                        : IconButton(
                            onPressed: () {
                              onFormatChanging(formatMonth);
                              setState(() {
                                _colourMonth = true;
                                _colourWeek = false;
                                expand = true;
                              });
                            },
                            icon: Image.asset(
                                AppAssetImagesFile.countryCodeArrow),
                          ),
                  ),
                  ..._listOfDayEvents(selectedCalendarDate!)
                      .map((myEvents) => ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(
                                  left: 16, right: 16, bottom: 16),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(4)),
                                  border: Border.all(
                                      width: 1.0, color: AppColor.blackColour),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColor.veryLightPink,
                                      offset: Offset(
                                        10.0,
                                        10.0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 2.0,
                                    ), //BoxShadow
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.0, 0.0),
                                      blurRadius: 0.0,
                                      spreadRadius: 0.0,
                                    ),
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppStrings.app,
                                      style: AppTextStyle.eventHeading),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(AppStrings.sn),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(AppAssetImagesFile.homelogo),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(AppStrings.firstName),
                                    ],
                                  ),
                                  const Divider(),
                                  Text(AppStrings.time),
                                ],
                              ),
                            ),
                          )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
