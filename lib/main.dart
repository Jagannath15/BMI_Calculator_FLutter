import 'package:bmi_app/constants/appconstants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI App",
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: Color(0xFF1C1C1C)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _heightct=TextEditingController();
  TextEditingController _weightct=TextEditingController();
  double result=0;
  String textres="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: assHex,
        
            fontWeight: FontWeight.w300,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        
        child: Column(

          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
      
                  width: 130,
                  child: TextField(
                    controller: _heightct,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: assHex),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Mtr Height',
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: assHex))),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightct,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: assHex),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'KG Weight',
                          hintStyle: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w300,
                              color: assHex))),
                )
              ],
            ),
            SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: () {
                double _h=double.parse(_heightct.text);
                double _w=double.parse(_weightct.text);
                setState(() {
                  result=_w/(_h*_h);
                  if(result>25){
                    textres="Over Weight";
                  }
                  else if(result>=18 && result<=25){
                    textres='Normal Weight';
                  }
                  else{
                    textres="Under Weight";
                  }
                  }
                
                );
              },
              child: Container(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: assHex),
                ),
              ),
            ),
              SizedBox(
              height: 70,
            ),
            Container(
              child: Text(
                result.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 56, fontWeight: FontWeight.bold, color: assHex),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Visibility(
              visible: textres.isNotEmpty,
              child: Container(
                child: Text(
                  textres,
                  style: TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold, color: assHex),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
