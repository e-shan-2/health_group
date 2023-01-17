import 'package:flutter/material.dart';
import 'package:health_group/model/events.dart';
import 'package:health_group/ui/text_field_event.dart';
import 'package:health_group/utils/app_string.dart';

// ignore: must_be_immutable
class AlertEventDialog extends StatefulWidget {
  TextEditingController titleController;
  TextEditingController descpController;
   Map<DateTime, List<MyEvents>> mySelectedEvents;
   DateTime? selectedCalendarDate;
   AlertEventDialog({ 
     required this.mySelectedEvents,
    this.selectedCalendarDate,
    required this.titleController,
    required this.descpController,
    Key? key }) : super(key: key);

  @override
  State<AlertEventDialog> createState() => _AlertEventDialogState();
}

class _AlertEventDialogState extends State<AlertEventDialog> {
  @override
  Widget build(BuildContext context) {
    return
    AlertDialog(
              title: Text(AppStrings.newEvent),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFieldEvent(
                      controller: widget.titleController,
                      hint: AppStrings.enterTitile),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFieldEvent(
                      controller:widget. descpController,
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
                    if (widget.titleController.text.isEmpty &&
                        widget.descpController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(AppStrings.titleDescription),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                      //Navigator.pop(context);
                      return;
                    } else {
                      setState(() {
                        if (widget.mySelectedEvents[widget.selectedCalendarDate] != null) {
                          widget.mySelectedEvents[widget.selectedCalendarDate]?.add(MyEvents(
                              eventTitle: widget.titleController.text,
                              eventDescp: widget.descpController.text));
                        } else {
                          widget.mySelectedEvents[widget.selectedCalendarDate!] = [
                            MyEvents(
                                eventTitle: widget.titleController.text,
                                eventDescp: widget.descpController.text)
                          ];
                        }
                      });

                      widget.titleController.clear();
                      widget.descpController.clear();

                      Navigator.pop(context);
                      return;
                    }
                  },
                  child: Text(AppStrings.add),
                ),
              ],
            );
  }
}