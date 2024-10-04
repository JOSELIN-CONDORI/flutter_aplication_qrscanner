import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String qrValue = "Codigo Qr:";

  Future<void> ScanQr() async {
    String cameraScanResult = await scanner.scan();
    setState(() {
      qrValue = cameraScanResult;
    });
  }
  // This widget is the root of your application.
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qr Scan',
      home: Scaffold(
        appBar: AppBar(  
          backgroundColor: Colors.grey[300],
          title: Text(
            'Qr Scan' 
            ),
          ),

          body: Center(
            child: Container(
              child: Text(
              qrValue,
                textAlign: TextAlign center,
                style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      
        floatingActionButton: FloatingActionButton(
          onPressed: () => ScanQr(),
          child: Icon(
            Icons.camera,
        ),
      ),
    ),
  );
  }
}