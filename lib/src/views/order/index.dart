import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:valbury_mockup/src/components/appbars/default_appbar.dart';
import 'package:valbury_mockup/src/components/buttons/global_buttons.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';
import 'package:valbury_mockup/src/helpers/theme/annotated_region.dart';
import 'package:valbury_mockup/src/views/profiles/index.dart';

class OrderTab extends StatefulWidget {
  const OrderTab({super.key});

  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  List<Tab> listPosition = const <Tab>[
    Tab(text: 'Open'),
    Tab(text: 'Pending'),
    Tab(text: 'History'),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return defaultAnnotatedRegion(
      child: GestureDetector(
        child: DefaultTabController(
          length: listPosition.length,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: GlobalAppBar.appbarMarket(
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(
                kToolbarHeight * 2.5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: size.width - 20,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text("Balance", style: GlobalTextStyle.defaultTextStyle(fontSize: 10)),
                                    const SizedBox(width: 6),
                                    Text("\$100", style: GlobalTextStyle.defaultTextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: VerticalDivider(),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Equity", style: GlobalTextStyle.defaultTextStyle(fontSize: 10)),
                                    const SizedBox(width: 6),
                                    Text("\$100", style: GlobalTextStyle.defaultTextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Real-time P/L", style: GlobalTextStyle.defaultTextStyle(color: Colors.white, fontSize: 12),),
                              Text("\$0.00", style: GlobalTextStyle.defaultTextStyle(color: Colors.lightGreen, fontSize: 14),),
                            ],
                          )
                        ],
                      ),
                    ),
                    TabBar(
                      tabs: listPosition,
                      dividerColor: Colors.black12,
                      enableFeedback: true,
                      indicatorColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelPadding: const EdgeInsets.all(5),
                      labelStyle: GlobalTextStyle.defaultTextStyle(fontSize: 10),
                    ),
                  ],
                ),
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
              children: List.generate(listPosition.length, (index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 80),
                    child: Column(
                      children: [
                        Image.asset('assets/images/no_data.png', width: size.width/2),
                        Text("Tidak ada order", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                        const SizedBox(height: 10),
                        GlobalButtons.defaultCupertinoButton(
                          onPressed: (){},
                          title: "Lihat Instrument Trading"
                        )
                      ],
                    ),
                  ),
                );
              },)
            ),
          ),
        ),
      )
    );
  }
}