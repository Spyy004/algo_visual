import 'package:algovisual/Sort.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:algovisual/Search.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.center,
            colors: [
              Colors.yellow[800],
              Colors.yellow[500],
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TyperAnimatedTextKit(
                text: ["Algo Visualizer"],
                textStyle: GoogleFonts.abrilFatface(
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PageFinderButton(
                  Display: 'Sorting',
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sorting()));
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                PageFinderButton(
                  Display: 'Searching',
                  onpressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PageFinderButton extends StatelessWidget {
  PageFinderButton({this.Display, this.onpressed});

  final String Display;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: Colors.yellow[200],
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          child: Text(
            Display,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          onPressed: onpressed,
        ),
      ),
    );
  }
}
