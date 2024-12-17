import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:valbury_mockup/src/components/appbars/default_appbar.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';
import 'package:valbury_mockup/src/helpers/theme/annotated_region.dart';
import 'package:valbury_mockup/src/helpers/variable/global_variable.dart';
import 'package:valbury_mockup/src/views/profiles/index.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {

  final fifteenAgo = DateTime.now().subtract(const Duration(minutes: 15));

  List<Tab> listNewsTab = const <Tab>[
    Tab(text: 'Berita'),
    Tab(text: 'Bulletin'),
  ];
  var locale = 'id';


  String timeUntil(DateTime date) {
    return timeago.format(date, locale: locale, allowFromNow: true);
  }
  
  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('id', timeago.IdMessages());
    timeago.setLocaleMessages('id_short', timeago.IdMessages());
    return defaultAnnotatedRegion(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: DefaultTabController(
          length: listNewsTab.length,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: GlobalAppBar.appbarMarket(
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(
                  kToolbarHeight * 1.8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: CupertinoSearchTextField(),
                    ),
                    TabBar(
                      tabs: listNewsTab,
                      dividerColor: Colors.black12,
                      enableFeedback: true,
                      indicatorColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelPadding: const EdgeInsets.all(5),
                      labelStyle: GlobalTextStyle.defaultTextStyle(fontSize: 10),
                    ),
                  ],
                )
              ),
              actions: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: (){},
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        const Icon(EvaIcons.gift, color: Colors.white, size: 17),
                        const SizedBox(width: 5),
                        Text("Panen Cuan", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 11))
                      ],
                    ),
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(CupertinoIcons.bell, color: Colors.black), onPressed: (){}
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(CupertinoIcons.profile_circled, color: Colors.black), onPressed: (){
                    Get.to(() => const ProfilePage());
                  }
                ),
              ],
              leading: Container(
                color: Colors.transparent,
                child: Row(
                  children: [
                    Image.asset('assets/icons/ic_launcher.png'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("AllMedFX", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold)),
                        Text("Guest", style: GlobalTextStyle.defaultTextStyle(fontSize: 12)),
                      ],
                    )
                  ],
                )
              ),
            ),
            body: TabBarView(
              children: List.generate(listNewsTab.length, (i){
                if(i == 0){
                  return SingleChildScrollView(
                    child: Column(
                      children: List.generate(4, (i) => itemBerita(onPressed: (){})),
                    ),
                  );
                }
                return SingleChildScrollView(
                    child: Column(
                      children: List.generate(4, (i) => itemBulletin(onPressed: (){})),
                    ),
                  );
              })
            ),
          ),
        ),
      )
    );
  }

  // Item Berita
  Widget itemBerita({Function()? onPressed, String? type, String? title, String? imageURL}){
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 20),
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(type ?? "Forex", style: GlobalTextStyle.defaultTextStyle(fontSize: 12, color: GlobalVariableColors.primaryColor)),
                  Text(title ?? "Pasangan onshore USD/CNY yuan China naik 0,2% dan melayang di dekat level tertinggi dua tahun, sementara pasangan offshore USD/CNH naik tipis 0,1%. China mengakhiri Konferensi Kerja Ekonomi Pusat (CEWC) selama dua hari pada hari Kamis, tetapi meninggalkan pasar yang kecewa karena kurangnya langkah-langkah", maxLines: 3, style: GlobalTextStyle.defaultTextStyle(fontSize: 13))
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(image: imageURL != null ? NetworkImage(imageURL) : const AssetImage('assets/images/background_papper.jpg'), fit: BoxFit.cover)
              ),
            )
          ],
        ),
      )
    );
  }


  // Item Bulletin
  Widget itemBulletin({Function()? onPressed, String? type, String? title, String? time}){
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 20),
          ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.newspaper, color: GlobalVariableColors.primaryColor),
            const SizedBox(width: 7),
            Expanded(
              child: Text(title ?? "Pasangan onshore USD/CNY yuan China naik 0,2% dan melayang di dekat level tertinggi dua tahun, sementara pasangan offshore USD/CNH naik tipis 0,1%. China mengakhiri Konferensi Kerja Ekonomi Pusat (CEWC) selama dua hari pada hari Kamis, tetapi meninggalkan pasar yang kecewa karena kurangnya langkah-langkah", maxLines: 3, style: GlobalTextStyle.defaultTextStyle(fontSize: 13))
            ),
            const SizedBox(width: 10),
            Text(timeUntil(fifteenAgo), style: GlobalTextStyle.defaultTextStyle(fontSize: 10),)
            // Text(StringExtension.displayTimeAgoFromTimestamp('1966‑07‑30, 08:30:00'))
          ],
        ),
      )
    );
  }
}

extension StringExtension on String {
  static String displayTimeAgoFromTimestamp(String timestamp) {
    final year = int.parse(timestamp.substring(0, 4));
    final month = int.parse(timestamp.substring(5, 7));
    final day = int.parse(timestamp.substring(8, 10));
    final hour = int.parse(timestamp.substring(11, 13));
    final minute = int.parse(timestamp.substring(14, 16));

    final DateTime videoDate = DateTime(year, month, day, hour, minute);
    final int diffInHours = DateTime.now().difference(videoDate).inHours;

    String timeAgo = '';
    String timeUnit = '';
    int timeValue = 0;

    if (diffInHours < 1) {
      final diffInMinutes = DateTime.now().difference(videoDate).inMinutes;
      timeValue = diffInMinutes;
      timeUnit = 'minute';
    } else if (diffInHours < 24) {
      timeValue = diffInHours;
      timeUnit = 'hour';
    } else if (diffInHours >= 24 && diffInHours < 24 * 7) {
      timeValue = (diffInHours / 24).floor();
      timeUnit = 'day';
    } else if (diffInHours >= 24 * 7 && diffInHours < 24 * 30) {
      timeValue = (diffInHours / (24 * 7)).floor();
      timeUnit = 'week';
    } else if (diffInHours >= 24 * 30 && diffInHours < 24 * 12 * 30) {
      timeValue = (diffInHours / (24 * 30)).floor();
      timeUnit = 'month';
    } else {
      timeValue = (diffInHours / (24 * 365)).floor();
      timeUnit = 'year';
    }

    timeAgo = timeValue.toString() + ' ' + timeUnit;
    timeAgo += timeValue > 1 ? 's' : '';

    return timeAgo + ' ago';
  }
}