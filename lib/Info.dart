import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'Sort.dart';

class Information extends StatefulWidget {
  Information(this.SortNo, this.info);
  final  SortNo;
  String info = "Hello";
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  bool selected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Algo Visualizer',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              children: <Widget>[
                Container(
                  color: Colors.lime,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: TextLiquidFill(
                          text: widget.SortNo,
                          waveColor: Colors.redAccent,
                          boxBackgroundColor: Colors.lime,
                          waveDuration: Duration(seconds: 1),
                          textStyle: GoogleFonts.pacifico(textStyle:TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold),)
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.info,
                    style: GoogleFonts.ubuntu(textStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
