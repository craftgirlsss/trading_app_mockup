import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:valbury_mockup/src/components/appbars/default_appbar.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';
import 'package:valbury_mockup/src/helpers/theme/annotated_region.dart';
import 'package:valbury_mockup/src/helpers/variable/global_variable.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

List<Map<String, dynamic>> dataChatWA = [
  {
    'data' : {
      'user' : 'admin',
      'messages' : [
        "Hello",
        "Apa Kabar"
      ],
      'read' : true,
    }
  },
  {
    'data' : {
      'user' : 'user',
      'messages' : [
        "Baik",
        "Ada apa?"
      ],
      'read' : true,
    }
  },
  {
    'data' : {
      'user' : 'admin',
      'messages' : [
        "Maafin aku ya, aku udh buat kamu kecewa",
        "Aku pengen benai semuanya lagi, beri aku kesempatan ya sekali lagi."
      ],
      'read' : true,
    }
  },
  {
    'data' : {
      'user' : 'user',
      'messages' : [
        "Maafin aku, aku ga bisa",
        "Aku udh bener2 kecewa sama kamu, disaat aku bener2 tulus sama kamu, dengan mudahnya kamu kecewain aku."
      ],
      'read' : true,
    }
  },
];

List<Map<String, dynamic>> dataChat = [
  {
    'user' : 'admin',
    'messages' : "Hai kak ada yang bisa kami bantu?",
    'read' : true,
  },
  {
    'user' : 'user',
    'messages' : "Iya kak kami mau menanyakan perihal pendaftaran, biaya untuk awal deposit berapa ya kak? dan apakah bisa dijalankan dengan aplikasi MetaTrader 5?",
    'read' : true
  },
  {
    'user' : 'admin',
    'messages' : "Untuk deposit minimal \$50 ya kak untuk, untuk melakukan trading kita bisa melakukan nya di MetaTrader 4 atau 5, tergantung tipe akun yang anda tentukan kak.",
    'read' : false
  }
];


class ChatTab extends StatefulWidget {
  const ChatTab({super.key});

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> with WidgetsBindingObserver {

  SampleItem? selectedItem;
  TextEditingController messageController = TextEditingController();

  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    messageController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    setState(() {
      _isKeyboardVisible = bottomInset > 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return defaultAnnotatedRegion(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: GlobalAppBar.appbarMarket(
            iconColor: Colors.black,
            leading: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/icons/ic_launcher.png'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Customer Service", style: GlobalTextStyle.defaultTextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        const Icon(Icons.circle, color: Colors.green, size: 13),
                        const SizedBox(width: 3),
                        Text("Online", style: GlobalTextStyle.defaultTextStyle(fontSize: 11, color: Colors.black45),),
                      ],
                    ),
                  ],
                )
              ],
            ),
            actions: [
              PopupMenuButton<SampleItem>(
                icon: const Icon(Bootstrap.three_dots_vertical, size: 18),
                initialValue: selectedItem,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                onSelected: (SampleItem item) {
                  setState(() {
                    selectedItem = item;
                  });
                },
                color: Colors.white,
                itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemOne,
                    child: Text('Item 1'),
                  ),
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemTwo,
                    child: Text('Item 2'),
                  ),
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemThree,
                    child: Text('Item 3'),
                  ),
                ],
              ),
            ]
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              setState(() {});
            },
            child: Stack(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Image.asset('assets/images/bg_chat.jpg', fit: BoxFit.cover),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(dataChat.length, (i){
                      if(dataChat[i]['user'] == 'admin'){
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 16,
                              backgroundImage: AssetImage('assets/icons/ic_launcher.png'),
                            ),
                            BubbleSpecialTwo(
                              isSender: false,
                              color: Colors.white,
                              textStyle: GlobalTextStyle.defaultTextStyle(),
                              seen: dataChat[i]['read'] == true ? true : false,
                              text: dataChat[i]['messages']
                            ),
                          ],
                        );
                      }else{
                        return BubbleSpecialTwo(
                          isSender: true,
                          color: GlobalVariableColors.primaryColor,
                          seen: dataChat[i]['read'] == true ? true : false,
                          text: dataChat[i]['messages'],
                          textStyle: GlobalTextStyle.defaultTextStyle(),
                        );
                      }
                    }),
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: _isKeyboardVisible ? 10 : 100, top: 8),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: Material(
                    color: CupertinoColors.activeGreen, // Button color
                    child: InkWell(
                      splashColor: Colors.red, // Splash color
                      onTap: (){},
                      child: const AnimatedSize(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.fastEaseInToSlowEaseOut,
                        child: SizedBox(
                          width: 32,
                          height: 32,
                          child: Icon( CupertinoIcons.photo,
                            color: Colors.white,
                            size: 20
                          )
                        )
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                  height: 40,
                  child: CupertinoTextField(
                    autofocus: true,
                    textInputAction: TextInputAction.go,
                    enableSuggestions: true,
                    padding: const EdgeInsets.only(left: 10),
                    textAlignVertical: TextAlignVertical.center,
                    controller: messageController,
                    style: const TextStyle(color: Colors.black,fontFamily: "SF-Pro-Bold",fontSize: 17),
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: ClipOval(
                        child: Material(
                          color: CupertinoColors.activeGreen, // Button color
                          child: InkWell(
                            splashColor: Colors.red, // Splash color
                            onTap: () {},
                            child: const SizedBox(
                              width: 32,
                              height: 32,
                              child: Icon(CupertinoIcons.arrow_up,
                                color: Colors.white, size: 22
                              )
                            ),
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black38, width: 0.4)),
                    cursorColor: CupertinoColors.systemBlue,
                    keyboardType: TextInputType.multiline,
                    placeholder: "Tulis Pesan...",
                    placeholderStyle: const TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                // const SizedBox(width: 10),
                // ClipOval(
                //   child: Material(
                //     color: CupertinoColors.activeGreen, // Button color
                //     child: InkWell(
                //       splashColor: Colors.red, // Splash color
                //       onTap: () {},
                //       child: const SizedBox(
                //         width: 32,
                //         height: 32,
                //         child: Icon(CupertinoIcons.arrow_up,
                //           color: Colors.white, size: 22
                //         )
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}