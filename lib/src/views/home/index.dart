import 'package:country_flags/country_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:valbury_mockup/src/components/appbars/default_appbar.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';
import 'package:valbury_mockup/src/helpers/painters/donut_chart.dart';
import 'package:valbury_mockup/src/helpers/theme/annotated_region.dart';
import 'package:valbury_mockup/src/helpers/variable/global_variable.dart';
import 'package:valbury_mockup/src/views/profiles/index.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late TabController tabController;

  List<Map<String, String>> dataMarket = [
    {
      "market" : "USDJPY",
      "flag_pair" : "US",
      "flag_paired" : "JP" 
    },
    {
      "market" : "USDCAD",
      "flag_pair" : "US",
      "flag_paired" : "CA" 
    },
    {
      "market" : "EURUSD",
      "flag_pair" : "NZ",
      "flag_paired" : "US" 
    },
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return defaultAnnotatedRegion(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: GlobalAppBar.appbarMainPage(
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
          body: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Trading Signal AllMedFX", style: GlobalTextStyle.defaultTextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){},
                        child: const Text("Lihat Semua", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14, color: CupertinoColors.activeBlue),))
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  padding: const EdgeInsets.only(right: 15, top: 15, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 20),
                    ]
                  ),
                  child: Column(
                    children: List.generate(dataMarket.length, (index) => marketItem(
                      marketName: dataMarket[index]['market'],
                      flagPair: dataMarket[index]['flag_pair'],
                      flagPaired: dataMarket[index]['flag_paired']
                    )),
                  ),
                ),
                const SizedBox(height: 20),


                //Info dan Promo
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(15),
                  color: GlobalVariableColors.primaryColor.withOpacity(0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Info dan Promo", style: GlobalTextStyle.defaultTextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){},
                            child: const Text("Lihat Semua", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14, color: CupertinoColors.activeBlue),)),
                        ],
                      ),
                      SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(3, (index) {
                            return Container(
                              width: size.width / 1.2,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(15)
                              ),
                            );
                          },),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),


                //News Sentiment
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("News Sentiment", style: GlobalTextStyle.defaultTextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){},
                        child: const Text("Lihat Semua", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14, color: CupertinoColors.activeBlue),)),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 20),
                    ]
                  ),
                  child: Column(
                    children: List.generate(3, (index) => widgetNewsSentiment()),
                  ),
                ),
                const SizedBox(height: 20),


                //Tutorial
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(15),
                  color: GlobalVariableColors.primaryColor.withOpacity(0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tutorial", style: GlobalTextStyle.defaultTextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){},
                            child: const Text("Lihat Semua", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14, color: CupertinoColors.activeBlue),)),
                        ],
                      ),
                      SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(3, (index) {
                            return Container(
                              width: size.width / 1.2,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(15)
                              ),
                            );
                          },),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                //Berita dan Inspirasi
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Berita dan Inspirasi", style: GlobalTextStyle.defaultTextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: (){},
                        child: const Text("Lihat Semua", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14, color: CupertinoColors.activeBlue),)),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    child: _tabSection(context)),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  // Market Item
  Container marketItem({String? marketName, String? flagPair, String? flagPaired}){
    return Container(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Flag
                Row(
                  children: [
                    Stack(
                      children: [
                        CountryFlag.fromCountryCode(
                          flagPair ?? 'US',
                          width: 35,
                          shape: const Circle(),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: CountryFlag.fromCountryCode(
                            flagPaired ?? 'JP',
                            width: 25,
                            shape: const Circle(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(marketName ?? "USDJPY", style: GlobalTextStyle.defaultTextStyle(fontSize: 13,fontWeight: FontWeight.bold)),
                        Text("2 hour(s) ago", style: GlobalTextStyle.defaultTextStyle(fontSize: 10))
                      ],
                    )
                  ],
                ),

                //take profit
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Take Profit", style: GlobalTextStyle.defaultTextStyle(fontSize: 9)),
                    Text("152.0", style: GlobalTextStyle.defaultTextStyle(fontSize: 11))
                  ],
                ),

                //stop loss
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Stop Loss", style: GlobalTextStyle.defaultTextStyle(fontSize: 9)),
                    Text("152.15", style: GlobalTextStyle.defaultTextStyle(fontSize: 11))
                  ],
                ),

                //potensi cuan
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Potensi Cuan", style: GlobalTextStyle.defaultTextStyle(fontSize: 9)),
                    Text("\$533", style: GlobalTextStyle.defaultTextStyle(fontSize: 11))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 7, right: 20, top: 8, bottom: 8),
                  decoration: const BoxDecoration(
                    color: GlobalVariableColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Text("Buy on 70.0% of probabilities by Trading Central", style: GlobalTextStyle.defaultTextStyle(fontSize: 9, color: Colors.white)),
                ),
              ),
              const SizedBox(width: 20),
              SizedBox(
                height: 35,
                width: 80,
                child: CupertinoButton(
                  borderRadius: BorderRadius.circular(30),
                  padding: EdgeInsets.zero,
                  color: GlobalVariableColors.primaryColor,
                  child: Text("Buy", style: GlobalTextStyle.defaultTextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)), onPressed: (){}),
              )
            ],
          ),
          const Divider(thickness: 0.5)
        ],
      ),
    );
  }


  Container widgetNewsSentiment({String? marketName, String? flagPair, String? flagPaired}){
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(AntDesign.gold_fill, color: Colors.orangeAccent),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(marketName ?? "XAUUSD", style: GlobalTextStyle.defaultTextStyle(fontSize: 13,fontWeight: FontWeight.bold)),
                          Text(marketName ?? "Gold vs US Dollar", style: GlobalTextStyle.defaultTextStyle(fontSize: 10, color: Colors.black45)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text("Saat ini sentiment berita adalah 96% Sell", style: GlobalTextStyle.defaultTextStyle(fontSize: 10)),
                  const SizedBox(height: 8),
                  Container(
                    width: 80,
                    height: 3,
                    color: Colors.red,
                  )
                ],
              ),
              PieChart(
                data: const [
                  PieChartData(Colors.purple, 60),
                  PieChartData(Colors.blue, 25),
                  PieChartData(Colors.orange, 15),
                ],
                radius: 40,
              ),
            ],
          ),
          const Divider(thickness: 0.5)
        ],
      )
    );
  }



  Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Column(
      children: <Widget>[
        Container(
          color: Colors.transparent,
          child: TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: GlobalTextStyle.defaultTextStyle(),
            unselectedLabelColor: Colors.black38,
            tabs: const [
              Tab(text: "Berita"),
              Tab(text: "Bulettin"),
            ]),
        ),
        Container(
          color: Colors.transparent,
          height: 200,
          child: TabBarView(
            children: [
              Container(
                color: Colors.transparent,
                width: double.infinity,
                height: double.infinity,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesome.newspaper),
                      Text("Tidak ada Berita"),
                    ],
                  )
                ),
              ),
              Container(
                color: Colors.transparent,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Clarity.bullet_list_line),
                      Text("Tidak ada Bulletin"),
                    ],
                  )
                ),
              ),
          ]),
        ),
      ],
    ),
  );
}
}