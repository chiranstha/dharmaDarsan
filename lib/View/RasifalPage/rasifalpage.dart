// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hamro_patro/Riverpod/Models/TodayRasifalModel.dart';
import 'package:hamro_patro/Riverpod/Repository/RasifalController.dart';
import 'package:hamro_patro/View/RasifalPage/dailyrasifalpage.dart';
import 'package:hamro_patro/View/RasifalPage/monthlyrasifalpage.dart';
import 'package:hamro_patro/View/RasifalPage/weeklyrasifalpage.dart';
import 'package:hamro_patro/View/RasifalPage/yearlyrasifalpage.dart';
import 'package:hamro_patro/Widgets/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../Riverpod/Models/monthly_rasifal_model.dart';
import '../../Riverpod/Models/weekly_rasifal_model.dart';
import '../../Riverpod/Models/yearly_rasifal_model.dart';

class RasifalPage extends ConsumerStatefulWidget {
  const RasifalPage({super.key});

  @override
  _RasifalPageState createState() => _RasifalPageState();
}

class _RasifalPageState extends ConsumerState<RasifalPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController daytabController;
  List<TodayRasifalModel>? todaydetails;
  List<MonthRasifalModel>? monthdetails;
  List<WeeklyRasifalModel>? weekdetails;
  List<YearlyRasifalModel>? yeardetails;

  int rasindex = 0;
  int dayindex = 0;
  Future getinitdata() async {
    final today = await ref.read(rasifalProvider).gettodayrasifal();
    final monthly = await ref.read(rasifalProvider).getmonthlyrasifal();
    final weekly = await ref.read(rasifalProvider).getweeklyrasifal();
    final yearly = await ref.read(rasifalProvider).getyearlyrasifal();

    if (mounted) {
      setState(() {
        todaydetails = today;
        monthdetails = monthly;
        weekdetails = weekly;
        yeardetails = yearly;
      });
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: 12, vsync: this);
    daytabController = TabController(length: 4, vsync: this);

    _tabController.addListener(() {
      if (mounted) {
        setState(() {
          rasindex = _tabController.index;
        });
      }
    });
    daytabController.addListener(() {
      if (mounted) {
        setState(() {
          dayindex = daytabController.index;
        });
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getinitdata();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    daytabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: darkblack,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFdb1304),
        elevation: 0,
        titleSpacing: 0,
        title: TabBar(
          controller: daytabController,
          // labelColor: darkblack,
          // labelColor: Colors.black,
          labelStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
          indicatorColor: Colors.white,
          tabs: const [
            Tab(
              text: 'दैनिक',
            ),
            Tab(
              text: 'साप्ताहिक',
            ),
            Tab(
              text: 'मासिक',
            ),
            Tab(
              text: 'वार्षिक',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(width: 1, color: secondColor))),
        // color: Color(0xFFb25a38),
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(10),
        //   topRight: Radius.circular(10),
        // ),

        child: TabBar(
          controller: _tabController,
          physics: const BouncingScrollPhysics(),
          isScrollable: true,
          labelPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
          labelStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
          indicatorColor: Colors.blue,
          unselectedLabelStyle: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
          ),
          tabs: [
            Tab(
                text: 'मेष',
                icon: SvgPicture.asset(
                  'assets/images/aries.svg',
                  height: 9.w,
                )),
            Tab(
                text: 'वृष',
                icon: SvgPicture.asset(
                  'assets/images/brish.svg',
                  height: 9.w,
                )),
            Tab(
                text: 'मिथुन',
                icon: SvgPicture.asset(
                  'assets/images/gemini.svg',
                  color: Colors.orange,
                  height: 9.w,
                )),
            Tab(
                text: 'कर्कट',
                icon: SvgPicture.asset(
                  'assets/images/cancer.svg',
                  height: 9.w,
                )),
            Tab(
                text: 'सिंह',
                icon: SvgPicture.asset(
                  'assets/images/leo.svg',
                  height: 9.w,
                )),
            Tab(
                text: 'कन्या',
                icon: SvgPicture.asset(
                  'assets/images/kanya.svg',
                  height: 9.w,
                )),
            Tab(
                text: 'तुला',
                icon: SvgPicture.asset(
                  'assets/images/libra.svg',
                  height: 9.w,
                )),
            Tab(
                text: 'वृश्चिक',
                icon: SvgPicture.asset(
                  'assets/images/scorpio.svg',
                  height: 9.w,
                )),
            Tab(
                text: 'धनु',
                icon: SvgPicture.asset(
                  'assets/images/sagg.svg',
                  height: 9.w,
                )),
            Tab(
                text: 'मकर',
                icon: SvgPicture.asset(
                  'assets/images/capri.svg',
                  height: 9.w,
                )),
            Tab(
                text: 'कुम्भ',
                icon: SvgPicture.asset(
                  'assets/images/aqua.svg',
                  color: const Color(0xFFdb1304),
                  height: 9.w,
                )),
            Tab(
                text: 'मीन',
                icon: SvgPicture.asset(
                  'assets/images/fish.svg',
                  height: 9.w,
                )),
          ],
        ),
      ),
      body: TabBarView(
        controller: daytabController,
        children: [
          todaydetails == null
              ? const Center(child: CircularProgressIndicator())
              :
              // DailyRasifalPage(
              //   date: ,
              //     description:
              todaydetails!
                      .where((element) {
                        return element.rashiEnum == rasindex;
                      })
                      .toList()
                      .isNotEmpty
                  ? DailyRasifalPage(
                      description: todaydetails!
                          .where((element) {
                            return element.rashiEnum == rasindex;
                          })
                          .first
                          .description,
                      date: todaydetails!
                          .where((element) {
                            return element.rashiEnum == rasindex;
                          })
                          .first
                          .dateMiti)
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "राशिफल उपलब्ध छैन",
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
          weekdetails == null
              ? const Center(child: CircularProgressIndicator())
              : WeeklyRasifalPage(
                  indexr: rasindex,
                  description: weekdetails!
                          .where((element) {
                            return element.rashiEnum == rasindex;
                          })
                          .toList()
                          .isNotEmpty
                      ? weekdetails!
                          .where((element) {
                            return element.rashiEnum == rasindex;
                          })
                          .first
                          .description
                      : "राशिफल उपलब्ध छैन",
                ),
          monthdetails == null
              ? const Center(child: CircularProgressIndicator())
              : MonthlyRasifalPage(
                  indexr: rasindex,
                  description: monthdetails!
                          .where((element) {
                            return element.rashiEnum == rasindex;
                          })
                          .toList()
                          .isNotEmpty
                      ? monthdetails!
                          .where((element) {
                            return element.rashiEnum == rasindex;
                          })
                          .first
                          .description
                      : "राशिफल उपलब्ध छैन",
                ),
          yeardetails == null
              ? const Center(child: CircularProgressIndicator())
              : YearlyRasifalPage(
                  indexr: rasindex,
                  description: yeardetails!
                          .where((element) {
                            return element.rashiEnum == rasindex;
                          })
                          .toList()
                          .isNotEmpty
                      ? yeardetails!
                          .where((element) {
                            return element.rashiEnum == rasindex;
                          })
                          .first
                          .description
                      : "राशिफल उपलब्ध छैन",
                ),
        ],
      ),
    );
  }
}
