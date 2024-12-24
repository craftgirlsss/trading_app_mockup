import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:valbury_mockup/src/components/buttons/global_buttons.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';
import 'package:valbury_mockup/src/helpers/theme/annotated_region.dart';
import 'package:valbury_mockup/src/helpers/variable/global_variable.dart';
import 'package:valbury_mockup/src/views/news/pdf_print_preview.dart';
import 'package:valbury_mockup/src/views/profiles/edit_profile/index.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  List<Map<String, dynamic>> cardInformation = [
    {
      'onPressed' : (){},
      'firstRowTitle' : "Credit",
      'secondRowTitle' : "Free Margin",
      'firstRowValue' : "0.00",
      'secondRowValue' : "0.00",
      'titleButton' : "Top Up",
      'icon' : null
    },
    {
      'onPressed' : (){},
      'firstRowTitle' : "Margin",
      'secondRowTitle' : "Win Trades",
      'firstRowValue' : "0.00",
      'secondRowValue' : "0.0%",
      'titleButton' : "Overbook",
      'icon' : Iconsax.money_2_outline
    },
    {
      'onPressed' : (){},
      'firstRowTitle' : "Total P/L",
      'secondRowTitle' : "Margin Level",
      'firstRowValue' : "0.00",
      'secondRowValue' : "0.0%",
      'titleButton' : "Withdrawal",
      'icon' : Iconsax.money_remove_outline
    },
  ];



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return defaultAnnotatedRegion(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            forceMaterialTransparency: true,
            backgroundColor: Colors.white,
            title: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: (){
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: size.height / 2.7,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text("Choose Live Account", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                            const SizedBox(height: 20),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: (){},
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10
                                    )
                                  ]
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Brand(Brands.atlassian_confluence, size: 18),
                                            const SizedBox(width: 10),
                                            Text("Account ID 13024799", style: GlobalTextStyle.defaultTextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                                          ],
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            color: Colors.black12
                                          ),
                                          child: Text("Submitted", style: GlobalTextStyle.defaultTextStyle(color: Colors.black, fontSize: 10)),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 15, bottom: 2),
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                                        color: Colors.black12
                                      ),
                                      child: Row(
                                        children: [
                                          Text("Forex, Precious Metal, Crude Oil & Index", style: GlobalTextStyle.defaultTextStyle(color: Colors.black45, fontSize: 9)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 0, bottom: 15),
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                                        color: GlobalVariableColors.primaryColor
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Balance", style: GlobalTextStyle.defaultTextStyle(color: Colors.black45, fontSize: 10)),
                                              const SizedBox(width: 10),
                                              Text("\$0.00", style: GlobalTextStyle.defaultTextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                  child: VerticalDivider(color: Colors.black,)
                                                ),
                                                Text("Balance", style: GlobalTextStyle.defaultTextStyle(color: Colors.black45, fontSize: 10)),
                                                const SizedBox(width: 10),
                                                Text("\$0.00", style: GlobalTextStyle.defaultTextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ), 
                            ),
                            GlobalButtons.defaultElevatedButton(
                              onPressed: (){},
                              title: "Edit Account Data",
                              fontSize: 12
                            ),
                            GlobalButtons.defaultCupertinoTextButton(
                              onPressed: (){},
                              title: "Demo Account"
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("13024799", style: GlobalTextStyle.defaultTextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black
                    ),
                    child: Text("Demo", style: GlobalTextStyle.defaultTextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/icons/ic_launcher.png'),
                  ),
                  title: Text("Saputra Budianto", style: GlobalTextStyle.defaultTextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                  subtitle: Text('email@icloud.com', style: GlobalTextStyle.defaultTextStyle(color: Colors.black45, fontSize: 11)),
                  trailing: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: const Icon(OctIcons.pencil, color: Colors.black),
                    onPressed: (){}
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Balance", style: GlobalTextStyle.defaultTextStyle(fontSize: 10)),
                        Text("\$154", style: GlobalTextStyle.defaultTextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Equity", style: GlobalTextStyle.defaultTextStyle(fontSize: 10)),
                        Text("\$154", style: GlobalTextStyle.defaultTextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.only(top: 15, bottom: 10, right: 30),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: List.generate(cardInformation.length, (i){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: itemMenu(
                          firstRowTitle: cardInformation[i]['firstRowTitle'],
                          firstRowValue: cardInformation[i]['firstRowValue'],
                          onPressed: cardInformation[i]['onPressed'],
                          secondRowTitle: cardInformation[i]['secondRowTitle'],
                          secondRowValue: cardInformation[i]['secondRowValue'],
                          titleButton: cardInformation[i]['titleButton'],
                          icon: cardInformation[i]['icon']
                        ),
                      );
                    }),
                  )
                ),
                SizedBox(
                  width: size.width / 1.2,
                  child: GlobalButtons.defaultOutlinedButton(
                    onPressed: (){},
                    outlineColor: Colors.black,
                    title: 'Top Up Balance',
                    titleColor: Colors.black
                  ),
                ),
                const SizedBox(height: 10),
                ListTile(
                  onTap: (){
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: size.height / 2.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("More Features", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                const SizedBox(height: 20),
                                ListTile(
                                  dense: true,
                                  onTap: (){},
                                  leading: const Icon(Iconsax.gift_outline, color: Colors.black, size: 30),
                                  title: Text("Loyalty Program", style: GlobalTextStyle.defaultTextStyle(fontSize: 16)),
                                ),
                                ListTile(
                                  dense: true,
                                  onTap: (){},
                                  leading: const Icon(Iconsax.profile_add_outline, color: Colors.black, size: 30),
                                  title: Text("Ajak Teman", style: GlobalTextStyle.defaultTextStyle(fontSize: 16)),
                                ),
                                ListTile(
                                  dense: true,
                                  onTap: (){},
                                  leading: const Icon(AntDesign.line_chart_outline, color: Colors.black, size: 30),
                                  title: Text("Dynamic Leverage", style: GlobalTextStyle.defaultTextStyle(fontSize: 16)),
                                ),
                                ListTile(
                                  dense: true,
                                  onTap: (){},
                                  leading: const Icon(AntDesign.swap_outline, color: Colors.black, size: 30),
                                  title: Text("Free Swap", style: GlobalTextStyle.defaultTextStyle(fontSize: 16)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  leading: const Icon(Icons.group_work_outlined, color: Colors.black, size: 30),
                  title: Text("Features", style: GlobalTextStyle.defaultTextStyle(fontSize: 16)),
                ),
                ListTile(
                  onTap: (){},
                  leading: const Icon(EvaIcons.phone_call_outline, color: Colors.black, size: 30),
                  title: Text("Contact Us", style: GlobalTextStyle.defaultTextStyle(fontSize: 16)),
                ),
                ListTile(
                  onTap: (){
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: size.height / 2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("Settings", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                                const SizedBox(height: 20),
                                ListTile(
                                  dense: true,
                                  onTap: (){
                                    Get.to(() => const EditProfile());
                                  },
                                  leading: const Icon(Clarity.update_line, color: Colors.black, size: 30),
                                  title: Text("Ubah Data", style: GlobalTextStyle.defaultTextStyle(fontSize: 16)),
                                ),
                                ListTile(
                                  dense: true,
                                  onTap: (){
                                    Get.to(() => const PdfPrintPreview());
                                  },
                                  leading: const Icon(Icons.privacy_tip_outlined, color: Colors.black, size: 30),
                                  title: Text("Kebijakan Privasi", style: GlobalTextStyle.defaultTextStyle(fontSize: 16)),
                                ),
                                ListTile(
                                  dense: true,
                                  onTap: (){},
                                  leading: const Icon(AntDesign.line_chart_outline, color: Colors.black, size: 30),
                                  title: Text("Dynamic Leverage", style: GlobalTextStyle.defaultTextStyle(fontSize: 16)),
                                ),
                                ListTile(
                                  dense: true,
                                  onTap: (){},
                                  leading: const Icon(AntDesign.info_circle_outline, color: Colors.black, size: 30),
                                  title: Text("Syarat dan Ketentuan", style: GlobalTextStyle.defaultTextStyle(fontSize: 16)),
                                ),
                                ListTile(
                                  dense: true,
                                  onTap: (){},
                                  leading: const Icon(CupertinoIcons.settings, color: Colors.black, size: 30),
                                  title: Text("Pengaturan", style: GlobalTextStyle.defaultTextStyle(fontSize: 16)),
                                ),
                                ListTile(
                                  dense: true,
                                  onTap: (){},
                                  leading: const Icon(EvaIcons.person_delete_outline, color: Colors.black, size: 30),
                                  title: Text("Hapus Akun", style: GlobalTextStyle.defaultTextStyle(fontSize: 16)),
                                ),
                                ListTile(
                                  dense: true,
                                  onTap: (){},
                                  leading: const Icon(Iconsax.logout_1_outline, color: Colors.black, size: 30),
                                  title: Text("Log Out", style: GlobalTextStyle.defaultTextStyle(fontSize: 16)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  leading: const Icon(CupertinoIcons.settings_solid, color: Colors.black, size: 30),
                  title: Text("Settings", style: GlobalTextStyle.defaultTextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 20),
                Center(child:  Text('1.0.0+1', style: GlobalTextStyle.defaultTextStyle(color: Colors.black45)))
              ],
            ),
          ),
        ),
      )
    );
  }

  Row itemMenu({String? titleButton, IconData? icon, String? firstRowTitle, String? secondRowTitle, String? firstRowValue, String? secondRowValue, Function()? onPressed}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: 130,
            decoration: BoxDecoration(
              color: GlobalVariableColors.primaryColor.withOpacity(0.5),
              border: const Border(
                bottom: BorderSide(color: GlobalVariableColors.primaryColor),
                top: BorderSide(color: GlobalVariableColors.primaryColor),
                right: BorderSide(color: GlobalVariableColors.primaryColor),
              ),
              borderRadius: const BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
            ),
            child: Row(
              children: [
                Icon(icon ?? Iconsax.wallet_add_1_outline, size: 15, color: Colors.white),
                const SizedBox(width: 5),
                Text(titleButton ?? 'Top Up', style: GlobalTextStyle.defaultTextStyle(fontSize: 12, color: Colors.white))
              ],
            ),
          ), 
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(firstRowTitle ?? 'Credit', style: GlobalTextStyle.defaultTextStyle(fontSize: 10, color: Colors.white60)),
                  Text(firstRowValue ?? '\$0.00', style: GlobalTextStyle.defaultTextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(secondRowTitle ?? 'Free Margin', style: GlobalTextStyle.defaultTextStyle(fontSize: 10, color: Colors.white60)),
              Text(secondRowValue ?? '\$0.00', style: GlobalTextStyle.defaultTextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    );
  }
}