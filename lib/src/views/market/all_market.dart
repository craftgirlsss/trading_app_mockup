import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';

class AllMarket extends StatefulWidget {
  const AllMarket({super.key});

  @override
  State<AllMarket> createState() => _AllMarketState();
}

class _AllMarketState extends State<AllMarket> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: DataTable(
        dataTextStyle: GlobalTextStyle.defaultTextStyle(fontSize: 10),
        columns: [
          DataColumn(
            label: Text('Market', style: GlobalTextStyle.defaultTextStyle(fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ),
          DataColumn(
            label: Text('Change', style: GlobalTextStyle.defaultTextStyle(fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ),
          DataColumn(
            label: Text('Buy/Sell', style: GlobalTextStyle.defaultTextStyle(fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ),
        ], 
        rows: List.generate(10, (index) {
          if(index == 1){
            return itemListMarket(
              buy: '24803',
              sell: "20380",
              pip: '4.1',
              isCurrencyMarket: true,
              marketFullName: "Australia Dollar vs Japan",
              pairCountryID: "AU",
              pairedCountryID: "JP",
              percent: '4.5%',
              marketName: "AUDJPY"
            );
          }else if(index == 0){
            return itemListMarket(
              buy: '24803',
              sell: "20380",
              pip: '3.0',
              isCurrencyMarket: true,
              marketFullName: "New Zeland vs US Dollar",
              pairCountryID: "NZ",
              pairedCountryID: "US",
              percent: '4.5%',
              marketName: "NZDUSD"
            );
          }
          return itemListMarket();
        },)
      ),
    );
  }

  DataRow itemListMarket({bool? isCurrencyMarket, IconData? icon, String? pairCountryID, String? pairedCountryID, String? marketName, String? pip, String? buy, String? sell, String? marketFullName, Color? iconColor, String? percent}){
    return DataRow(
      cells: [
        // Market Name
        DataCell(
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isCurrencyMarket == true 
                ? Stack(
                  children: [
                    CountryFlag.fromCountryCode(
                      pairCountryID ?? 'US',
                      width: 30,
                      shape: const Circle(),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CountryFlag.fromCountryCode(
                        pairedCountryID ?? 'JP',
                        width: 20,
                        shape: const Circle(),
                      ),
                    ),
                  ],
                )
              : Icon(icon ?? AntDesign.gold_fill, color: iconColor ?? Colors.orange),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(marketName ?? "XAUUSD", style: GlobalTextStyle.defaultTextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)),
                  Text(marketFullName ?? "Gold vs US Dollar", style: GlobalTextStyle.defaultTextStyle(color: Colors.black45, fontSize: 8))
                ],
              )
            ],
          )
        ),

        // Change
        DataCell(Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pip ?? '0.00'),
            Text(percent ?? '0.0%'),
          ],
        )),
        DataCell(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(buy ?? '0.00', style: GlobalTextStyle.defaultTextStyle(color: Colors.green, fontSize: 10)),
              Text(sell ?? '0.00', style: GlobalTextStyle.defaultTextStyle(color: Colors.red, fontSize: 10)),
            ],
          )
        )
      ]
    );
  }
}