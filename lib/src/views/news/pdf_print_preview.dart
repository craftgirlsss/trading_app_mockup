import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:valbury_mockup/src/components/styles/text_style.dart';
import 'package:valbury_mockup/src/helpers/theme/annotated_region.dart';

class PdfPrintPreview extends StatefulWidget {
  const PdfPrintPreview({super.key});

  @override
  State<PdfPrintPreview> createState() => _PdfPrintPreviewState();
}

class _PdfPrintPreviewState extends State<PdfPrintPreview> {

  final GlobalKey widgetKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return defaultAnnotatedRegion(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: RepaintBoundary(
                    key: widgetKey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      width: size.width - 20,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('assets/icons/ic_launcher.png', width: 80),
                              const Spacer(),
                              SizedBox(
                                width: size.width / 2.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("PT. All Media Indo", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, fontSize: 8), textAlign: TextAlign.end),
                                    const SizedBox(height: 7),
                                    Text("Perum Surya garden and square A21, Balun, Sidodadi, Kec. Candi, Kabupaten Sidoarjo, Jawa Timur 61271".toUpperCase(), style: GlobalTextStyle.defaultTextStyle(fontSize: 8), textAlign: TextAlign.end),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const Divider(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Formulir Nomor : 107.PBK.01", style: GlobalTextStyle.defaultTextStyle(fontSize: 8, fontWeight: FontWeight.bold), textAlign: TextAlign.end),
                              const Spacer(),
                              SizedBox(
                                width: size.width / 2.5,
                                child: Text("Lampiran Peraturan Kepala Badan Pengawas Perdagangan Berjangka Komoditi\nNomor: 107/BAPPEBTI/PER/11/2023", style: GlobalTextStyle.defaultTextStyle(fontSize: 8), textAlign: TextAlign.end),
                              )
                            ],
                          ),
                          const SizedBox(height: 13),
                          Center(
                            child: Text("PROFIL PERUSAHAAN PIALANG BERJANGKA", style: GlobalTextStyle.defaultTextStyle(fontSize: 10, fontWeight: FontWeight.bold))
                          ),
                          const SizedBox(height: 13),
                          Container(
                            padding: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: Table(
                                    columnWidths: const {
                                      1: FlexColumnWidth(0.1)
                                    },
                                    children: [
                                      TableRow(
                                        children: [
                                          Text('Nama Perusahaan', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text(":", textAlign: TextAlign.end, style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text('PT. All Media Indo', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                        ]
                                      ),
                                      TableRow(
                                        children: [
                                          Text('Alamat', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text(":", textAlign: TextAlign.end, style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text('Perum Surya garden and square A21, Balun, Sidodadi, Kec. Candi, Kabupaten Sidoarjo, Jawa Timur 61271', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                        ]
                                      ),
                                      TableRow(
                                        children: [
                                          Text('Nomor Telpon', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text(":", textAlign: TextAlign.end, style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text('085174391003', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                        ]
                                      ),
                                      TableRow(
                                        children: [
                                          Text('Email', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text(":", textAlign: TextAlign.end, style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text('indooallmedia@gmail.com', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                        ]
                                      ),
                                      TableRow(
                                        children: [
                                          Text('Website', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text(":", textAlign: TextAlign.end, style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text('https://allmediaindo.com', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                        ]
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(color: Colors.black),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Susunan Pengurus Perusahaan : ", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, fontSize: 8)),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  color: Colors.white,
                                  child: Table(
                                    columnWidths: const {
                                      1: FlexColumnWidth(0.1)
                                    },
                                    children: [
                                      TableRow(
                                        children: [
                                          Text('Dewan Direksi', style: GlobalTextStyle.defaultTextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
                                          Text("", textAlign: TextAlign.end, style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text('', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                        ]
                                      ),
                                      TableRow(
                                        children: [
                                          Text('1. President Direktur', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text(":", textAlign: TextAlign.end, style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text('M. Alfi Syahrin S.Kom', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                        ]
                                      ),
                                      TableRow(
                                        children: [
                                          Text('2. Direktur Kepatuhan', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text(":", textAlign: TextAlign.end, style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text('Khoiriyah Yusrowati S.Ak', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                        ]
                                      ),
                                      TableRow(
                                        children: [
                                          Text('Dewan Komisaris', style: GlobalTextStyle.defaultTextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
                                          Text("", textAlign: TextAlign.end, style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text('', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                        ]
                                      ),
                                      TableRow(
                                        children: [
                                          Text('1. Komisaris Utama', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text(":", textAlign: TextAlign.end, style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text('M. Alfi Syahrin S.Kom', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                        ]
                                      ),
                                      TableRow(
                                        children: [
                                          Text('2. Komisaris', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text(":", textAlign: TextAlign.end, style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text('Khoiriyah Yusrowati S.Ak', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                        ]
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(color: Colors.black),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Susunan Pemegang Saham Perusahaan : ", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, fontSize: 8)),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 13),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("1. M. Alfi Syahrin S.Kom", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.normal, fontSize: 8)),
                                          Text("2. Khoiriyah Yusrowati S.Ak", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.normal, fontSize: 8)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(color: Colors.black),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Nomor dan Tanggal Izin Usaha dari BAPPEBTI : ", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, fontSize: 8)),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 13),
                                  color: Colors.white,
                                  child: Table(
                                    children: [
                                      TableRow(
                                        children: [
                                          Text('Nomor: 107/BAPPEBTI/PER/11/2023', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text('Tanggal : ${DateFormat('yyyy-MM-dd').format(DateTime.now())}', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                        ]
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(color: Colors.black),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Nomor dan Tanggal Keanggotaan Bursa Berjangka : ", style: GlobalTextStyle.defaultTextStyle(fontWeight: FontWeight.bold, fontSize: 8)),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 13),
                                  color: Colors.white,
                                  child: Table(
                                    children: [
                                      TableRow(
                                        children: [
                                          Text('Nomor: 107/BAPPEBTI/PER/11/2023', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                          Text('Tanggal : ${DateFormat('yyyy-MM-dd').format(DateTime.now())}', style: GlobalTextStyle.defaultTextStyle(fontSize: 8)),
                                        ]
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: FloatingActionButton(
              onPressed: (){},
              child: const Icon(CupertinoIcons.cloud_download),
            ),
          ),
        ),
      )
    );
  }
}