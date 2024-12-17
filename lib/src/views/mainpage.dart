import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';
import 'package:valbury_mockup/src/helpers/theme/annotated_region.dart';
import 'package:valbury_mockup/src/views/chat/index.dart';
import 'package:valbury_mockup/src/views/home/index.dart';
import 'package:valbury_mockup/src/views/market/index.dart';
import 'package:valbury_mockup/src/views/news/index.dart';
import 'package:valbury_mockup/src/views/order/index.dart';
// import 'package:valbury_mockup/src/views/news/index.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> with SingleTickerProviderStateMixin {

  bool _isVisible = true;

  void _toggleNavBar() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Home(),
    const MarketTab(),
    const OrderTab(),
    const NewsTab(),
    const ChatTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return defaultAnnotatedRegion(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _isVisible ? 80.0 : 0.0,
          child: Wrap(
            children: [
              Visibility(
                visible: _isVisible,
                child: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Bootstrap.house_fill),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Iconsax.chart_1_bold),
                      label: 'Market',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Clarity.wallet_solid, size: 24),
                      activeIcon:Icon(Clarity.wallet_solid, size: 26) ,
                      label: 'Order',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(FontAwesome.newspaper),
                      label: 'News',
                    ),
                    BottomNavigationBarItem(
                      // icon: _selectedIndex == 4 ? _isVisible ? const Icon(Icons.keyboard_arrow_down_rounded, size: 28) : const Icon(Icons.keyboard_arrow_up_rounded, size: 28) : const Icon(ZondIcons.conversation),
                      icon:  const Icon(ZondIcons.conversation),
                      label: 'Chat',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                  selectedLabelStyle: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  unselectedLabelStyle: GlobalTextStyle.defaultTextStyle(color: Colors.black54, fontSize: 12),
                  selectedItemColor: Colors.black,
                  unselectedIconTheme: const IconThemeData(color: Colors.black26),
                  selectedIconTheme: const IconThemeData(size: 25),
                  unselectedItemColor: Colors.black38,
                  onTap: _onItemTapped,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}