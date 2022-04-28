import 'dart:io';

import 'package:book/page/pdf_viewer_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'api/pdf_api.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'PDF Viewer';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return MainPage();
          },
        ),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          color: const Color.fromARGB(242, 242, 242, 242),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 15.h, right: 10.w, left: 10.w),
                  child: Column(
                    children: [
                      Text('ТЕОРЕТИЧЕСКИЕ ОСНОВЫ ОТДЕЛКИ',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text('ВОЛОКНИСТЫХ МАТЕРИАЛОВ',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),

                      Padding(
                        padding: EdgeInsets.only(top: 4.h),
                        child: Text('Учебник',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: Text('(под редакцией проф. А.М.Киселева)',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: ElevatedButton(
                    onPressed: () async {
                      const path = 'assets/sample.pdf';
                      final file = await PDFApi.loadAsset(path);
                      openPDF(context, file);
                    },
                    child: const Text('читать')),
              ),
            ],
          )),
        ),
      );

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file,)),
      );
}
