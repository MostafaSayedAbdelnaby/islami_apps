import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';

import 'package:hijri/hijri_calendar.dart';
import 'package:islamic_app/home/tabs/date_tab/azkar_card.dart';
import 'package:islamic_app/home/tabs/date_tab/prayer_time_card.dart';
import 'package:islamic_app/model/radio_model.dart';
import 'package:islamic_app/my_theme_data.dart';

class DateTab extends StatefulWidget {
  const DateTab({super.key});

  @override
  State<DateTab> createState() => _DateTabState();
}

class _DateTabState extends State<DateTab> {
  /// Milady date
  DateTime dateNow = DateTime.now();

  // late int hour = dateNow.hour;
  // late int day = dateNow.day;
  // late int minute = dateNow.minute;
  // late String timeOfPrayer =
  //     "$hour:$minute"; // return time now not time of prayerTimes
  //  late String timeOfPrayer =
  //  DateFormat('kk:mm').format(dateNow); // return time now not time of prayerTimes

  late String dayName = getDayName(dateNow.weekday);
  late String month = _getMonthName(dateNow.month);
  late int year = dateNow.year;

  // late String formattedDate = DateFormat('dd MMMM,\n yyyy').format(dateNow);
  late String formattedDate =
      '${dateNow.day.toString().padLeft(2, '0')} ${getHijriMonth(dateNow.month)},\n${dateNow.year}';

  String _getMonthName(int month) {
    const List<String> monthNames = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return monthNames[month - 1]; // Month is 1-indexed
  }

  String getDayName(int day) {
    const List<String> dayNames = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return dayNames[day - 1]; // Day is 1-indexed
  }

  /// Hijri Date
  HijriCalendar today = HijriCalendar.now();

  late String formattedDateHijri =
      '${today.hDay.toString().padLeft(2, '0')} ${getHijriMonth(today.hMonth)},\n     ${today.hYear}';

  String getHijriMonth(int month) {
    const List<String> hijriMonths = [
      'Muh',
      'Saf',
      'Rab-I',
      'Rab-II',
      'Jum-I',
      'Jum-II',
      'Raj',
      'Sha',
      'Ram',
      'Shaw',
      'Dhu-Q',
      'Dhu-H'
    ];
    return hijriMonths[month - 1]; // Month is 1-indexed
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Image.asset(
              "assets/images/islami.png",
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 280,
                      decoration: BoxDecoration(
                          color: const Color(0xff856B3F),
                          borderRadius: BorderRadius.circular(40)),
                      child: Image.asset(
                        "assets/images/container_date.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _topItemOfCard(),
                        _prayerTimeHorizontal(prayerTimeList),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 14),
                _azkar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topItemOfCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Vector 1.png",
                width: 60,
                height: 50,
                fit: BoxFit.cover,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/Rectangle 140.png",
                    width: 156,
                    height: 90,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pray Time",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 20,
                              color: const Color(0xb5202020),
                            ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        dayName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 20,
                              color: Color(0xE8202020),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset(
                "assets/images/Vector 2.png",
                width: 60,
                height: 50,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formattedDate,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                    ),
              ),
              Text(
                formattedDateHijri,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// إحداثيات القاهرة
  Coordinates coordinates = Coordinates(30.0444, 31.2357);
  CalculationParameters params =
      CalculationMethod.muslim_world_league.getParameters();

  /// حساب أوقات الصلاة
  late PrayerTimes prayerTimes = PrayerTimes.today(coordinates, params);

  ///  .padLeft(2, '0'):
  ///  هذه الدالة تُستخدم لتنسيق النص. إذا كانت قيمة الساعة أو الدقيقة أقل من 10، ستقوم بإضافة صفر على اليسار.
  ///  على سبيل المثال:
  ///  إذا كانت الساعة 5، ستصبح "05".
  String formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  // list of prayerTimes
  late List<String> prayerTimeList = [
    formatTime(prayerTimes.fajr),
    formatTime(prayerTimes.dhuhr),
    formatTime(prayerTimes.asr),
    formatTime(prayerTimes.maghrib),
    formatTime(prayerTimes.isha),
  ];

  List<String> prayerName = [
    "Fajr",
    "Dhuhr",
    "Asr",
    "Maghrib",
    "Isha",
  ];

  Widget _prayerTimeHorizontal(List<String> prayerTimeList) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/images/Rectangle 141.png",
          fit: BoxFit.fill,
          height: 200,
        ),
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 120,
              child: ListView.separated(
                itemCount: prayerName.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 12,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // Pass the correct time from prayerTimeList using the index
                  return PrayerTimeCard(
                    prayerName: prayerName[index],
                    time: prayerTimeList[
                        index], // Correctly get the time for each prayer
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Next Pray-',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Color(0xBF202020)),
                      ),
                      TextSpan(
                        text: '02:23',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Color(0xFF202020)),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 50),
                Icon(
                  Icons.volume_off_rounded,
                  color: MyThemeData.blackColor,
                ),
                SizedBox(width: 24),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _azkar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Azkar",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Color(0xFFFEFFE8), fontWeight: FontWeight.w700)),
        SizedBox(height: 10),
        Row(
          children: [
            AzkarCard(
              radioModel: RadioModel(
                  title: "Evening Azkar", imageName: "morning_azkar"),
            ),
            const SizedBox(width: 20),
            AzkarCard(
              radioModel: RadioModel(
                  title: "Morning Azkar", imageName: "evening_azkar"),
            ),
          ],
        ),
      ],
    );
  }
}
