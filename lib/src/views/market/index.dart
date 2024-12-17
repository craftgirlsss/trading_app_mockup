import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:valbury_mockup/src/components/appbars/default_appbar.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';
import 'package:valbury_mockup/src/helpers/theme/annotated_region.dart';
import 'package:valbury_mockup/src/views/market/all_market.dart';
import 'package:valbury_mockup/src/views/profiles/index.dart';

class MarketTab extends StatefulWidget {
  const MarketTab({super.key});

  @override
  State<MarketTab> createState() => _MarketTabState();
}

class _MarketTabState extends State<MarketTab> {

  List<Tab> listMarket = const <Tab>[
    // Tab(child: AllMarket()),
    Tab(text: 'Foreign Exchange'),
    Tab(text: 'Foreign Exchange'),
    Tab(text: 'US Index'),
    Tab(text: 'Metals'),
    Tab(text: 'Index Asia'),
    Tab(text: 'Oil'),
  ];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return defaultAnnotatedRegion(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: DefaultTabController(
          length: listMarket.length,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: GlobalAppBar.appbarMarket(
              bottom: TabBar(
                tabs: listMarket,
                dividerColor: Colors.black12,
                enableFeedback: true,
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: const EdgeInsets.all(5),
                labelStyle: GlobalTextStyle.defaultTextStyle(fontSize: 10),
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
              )
            ),
            body: TabBarView(
              children: List.generate(listMarket.length, (i) => tabItem(
                widget: const AllMarket()
              )),
            ),
          ),
        ),
      )
    );
  }


  SingleChildScrollView tabItem({Widget? widget}){
    return SingleChildScrollView(
      child: Column(
        children: [
          Tab(
            child: widget,
          ),
        ],
      ),
    );
  }
}