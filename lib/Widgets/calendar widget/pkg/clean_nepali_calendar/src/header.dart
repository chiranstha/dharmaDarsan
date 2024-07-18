part of clean_nepali_calendar;

typedef HeaderBuilder = Widget Function(
  BoxDecoration decoration,
  double height,
  Function nextMonthHandler,
  Function prevMonthHandler,
  NepaliDateTime nepaliDateTime,
);

class CalendarHeader extends ConsumerStatefulWidget {
  const CalendarHeader({
    Key? key,
    required Language language,
    required Animation<double> chevronOpacityAnimation,
    required bool isDisplayingFirstMonth,
    required NepaliDateTime previousMonthDate,
    required this.date,
    required bool isDisplayingLastMonth,
    required NepaliDateTime nextMonthDate,
    required HeaderStyle headerStyle,
    required Function() handleNextMonth,
    required Function() handlePreviousMonth,
    this.onHeaderTapped,
    this.onHeaderLongPressed,
    required changeToToday,
    HeaderBuilder? headerBuilder,
  })  : _chevronOpacityAnimation = chevronOpacityAnimation,
        _isDisplayingFirstMonth = isDisplayingFirstMonth,
        _previousMonthDate = previousMonthDate,
        _isDisplayingLastMonth = isDisplayingLastMonth,
        _nextMonthDate = nextMonthDate,
        _headerStyle = headerStyle,
        _handleNextMonth = handleNextMonth,
        _handlePreviousMonth = handlePreviousMonth,
        _language = language,
        _changeToToday = changeToToday,
        _headerBuilder = headerBuilder,
        super(key: key);

  final Animation<double> _chevronOpacityAnimation;
  final bool _isDisplayingFirstMonth;
  final NepaliDateTime _previousMonthDate;
  final NepaliDateTime date;
  final bool _isDisplayingLastMonth;
  final NepaliDateTime _nextMonthDate;
  final HeaderStyle _headerStyle;
  final Function() _handleNextMonth;
  final Function() _handlePreviousMonth;
  final Function() _changeToToday;
  final Language _language;
  final HeaderGestureCallback? onHeaderTapped;
  final HeaderGestureCallback? onHeaderLongPressed;
  final HeaderBuilder? _headerBuilder;

  _onHeaderTapped() {
    if (onHeaderTapped != null) {
      onHeaderTapped!(date);
    }
  }

  _onHeaderLongPressed() {
    if (onHeaderLongPressed != null) {
      onHeaderLongPressed!(date);
    }
  }

  @override
  ConsumerState<CalendarHeader> createState() => _CalendarHeaderState();
}

class _CalendarHeaderState extends ConsumerState<CalendarHeader> {
  // geteventdata(String year, String month) async {
  //   final data = await ref.read(eventProvider).getEventsByMonth(year, month);
  //   ref.read(dateStateProvider.notifier).setdate(data);
  // }

  // getdata() {
  //   ref.read(dateStateProvider.notifier).setdate(widget.date);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getdata();
  // }

  @override
  Widget build(BuildContext context) {
    // print(widget.date);
    return InkWell(
      onTap: widget._onHeaderTapped,
      onLongPress: widget._onHeaderLongPressed,
      child: (widget._headerBuilder != null)
          ? widget._headerBuilder!(
              widget._headerStyle.decoration,
              _kDayPickerRowHeight,
              widget._handleNextMonth,
              widget._handlePreviousMonth,
              widget.date)
          : Container(
              color: const Color(0xFFdb1304),
              height: _kDayPickerRowHeight,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: widget._headerStyle.centerHeaderTitle
                        ? Center(
                            child: _buildTitle(),
                          )
                        : _buildTitle(),
                  ),
                  InkWell(
                    onTap: widget._changeToToday,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        widget._language == Language.nepali ? "आज" : 'Today',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Semantics(
                    sortKey: _MonthPickerSortKey.previousMonth,
                    child: FadeTransition(
                      opacity: widget._chevronOpacityAnimation,
                      child: IconButton(
                        padding: widget._headerStyle.leftChevronPadding,
                        icon: widget._headerStyle.leftChevronIcon,
                        color: Colors.black,
                        tooltip: widget._isDisplayingFirstMonth
                            ? null
                            : 'Previous month ${formattedMonth(widget._previousMonthDate.month, Language.english)} ${widget._previousMonthDate.year}',
                        onPressed: widget._isDisplayingFirstMonth
                            ? null
                            : widget._handlePreviousMonth,
                      ),
                    ),
                  ),
                  Semantics(
                    sortKey: _MonthPickerSortKey.nextMonth,
                    child: FadeTransition(
                      opacity: widget._chevronOpacityAnimation,
                      child: IconButton(
                        color: Colors.black,
                        padding: widget._headerStyle.rightChevronPadding,
                        icon: widget._headerStyle.rightChevronIcon,
                        tooltip: widget._isDisplayingLastMonth
                            ? null
                            : 'Next month ${formattedMonth(widget._nextMonthDate.month, Language.english)} ${widget._nextMonthDate.year}',
                        onPressed: widget._isDisplayingLastMonth
                            ? null
                            : widget._handleNextMonth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildTitle() {
    return FadeTransition(
      opacity: widget._chevronOpacityAnimation,
      child: ExcludeSemantics(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget._headerStyle.titleTextBuilder != null
                        ? widget._headerStyle.titleTextBuilder!(
                            widget.date,
                            widget._language,
                          )
                        : '${formattedMonth(widget.date.month, widget._language)} - ${widget._language == Language.english ? widget.date.year : NepaliUnicode.convert('${widget.date.year}')}',
                    style: widget._headerStyle.titleTextStyle,
                    textAlign: widget._headerStyle.centerHeaderTitle
                        ? TextAlign.center
                        : TextAlign.start,
                  ),
                  const Icon(Icons.arrow_drop_down, color: Colors.white)
                ],
              ),
              Text(
                widget._headerStyle.titleTextBuilder != null
                    ? widget._headerStyle.titleTextBuilder!(
                        widget.date,
                        widget._language,
                      )
                    : "${getFormattedEnglishMonth(widget.date.toDateTime().month)}/${getFormattedEnglishMonth(widget.date.toDateTime().month + 1)} - ${widget.date.toDateTime().year}",
                style: widget._headerStyle.titleTextStyle.copyWith(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.white),
                textAlign: widget._headerStyle.centerHeaderTitle
                    ? TextAlign.center
                    : TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String getFormattedEnglishMonth(int mnth) {
  switch (mnth) {
    case DateTime.january:
      return "Jan";
    case DateTime.february:
      return "Feb";
    case DateTime.march:
      return "Mar";
    case DateTime.april:
      return "April";
    case DateTime.june:
      return "Jun";
    case DateTime.july:
      return "Jul";
    case DateTime.august:
      return "Aug";
    case DateTime.september:
      return "Sep";
    case DateTime.october:
      return "Oct";
    case DateTime.november:
      return "Nov";
    case DateTime.december:
      return "Dec";
    default:
      return "Jan";
  }
}
