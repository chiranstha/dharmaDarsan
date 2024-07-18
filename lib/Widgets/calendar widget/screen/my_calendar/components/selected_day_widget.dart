import 'package:flutter/material.dart';

import '../../../../../Riverpod/Models/calendarmodel.dart';
import '../../../widgets/widget_space.dart';
import 'package:sizer/sizer.dart';

class SelectedEventWidget extends StatelessWidget {
  const SelectedEventWidget({
    Key? key,
    required this.monthYear,
    required this.dayOfMonth,
    required this.weekDay,
    required this.englishDate,
    required this.daysAgo,
    required this.details,
  }) : super(key: key);

  final String monthYear;
  final String dayOfMonth;
  final String weekDay;
  final String englishDate;
  final String daysAgo;
  final CalendarModel details;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    // print(details.tithi);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          horizontalSpace(width: 4),
          Container(
            alignment: Alignment.center,
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  monthYear,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                      fontSize: 11.sp,
                      color: Colors.black,
                      letterSpacing: 0.3,
                      fontWeight: FontWeight.w600),
                ),
                verticalSpace(),
                Text(
                  dayOfMonth,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                verticalSpace(),
                Text(
                  weekDay,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 12.sp,
                    color: Colors.black,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ),
          horizontalSpace(width: 1),
          Container(
            width: 0.05.w,
            height: 20.w,
            color: Colors.black,
          ),
          horizontalSpace(width: 10),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Text(
                          englishDate,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.labelSmall?.copyWith(
                            fontSize: 10.sp,
                            color: Colors.black.withOpacity(0.5),
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      horizontalSpace(width: 20),
                      Flexible(
                        child: Text(
                          daysAgo,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.labelSmall?.copyWith(
                            fontSize: 10.sp,
                            color: Colors.blue,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(height: 4.0),
                  details.dayDetails.isEmpty
                      ? SizedBox()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (var i in details.dayDetails)
                              Text(
                                i.description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: textTheme.labelSmall?.copyWith(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  letterSpacing: 0.3,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                          ],
                        ),
                  verticalSpace(height: 4.0),
                  details.tithi == null
                      ? Container()
                      : Text(
                          details.tithi,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: textTheme.labelSmall?.copyWith(
                            fontSize: 11.sp,
                            color: Colors.black.withOpacity(0.5),
                            letterSpacing: 0.4,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ]),
          )
        ],
      ),
    );
  }
}
