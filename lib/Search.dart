
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:algovisual/Info.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Map<String,String>m2={"Linear Search":"Start from the leftmost element of arr[] and one by one compare x with each element of arr[].\n\nIf x matches with an element, return the index.\n\nIf x doesn’t match with any of elements, return -1.\n\nTime Complexity(Average and Worst Case):O(n).\n\nTime Complexity(Best Case):O(1)","Binary Search":"Search a SORTED array by repeatedly dividing the search interval in half. Begin with an interval covering the whole array. If the value of the search key is less than the item in the middle of the interval, narrow the interval to the lower half. Otherwise narrow it to the upper half. Repeatedly check until the value is found or the interval is empty.\n\nTime Complexity(Average and Worst Case):O(Logn).\n\nTime Complexity(Best Case):O(1)"};
  dynamic i = 0, y, z=-1;
  dynamic key = 0;
  int key2=0;
  int mid,l,h,m=0;
  List<String> SearchArray = [
    '25',
    '20',
    '30',
    '391',
    '50',
    '394',
    '33',
    '932',
    '39',
    '999'
  ];
  List<int> SearchArray2 = [
   5,
    10,34,
    45,
    50,60,78,102,345,432
  ];
  void Rand(List<dynamic>SearchArray)
  {
    i = 0;
    for (int i = 0; i < 10; i++) {
      int p = Random().nextInt(999);
      SearchArray[i] = p.toString();
    }
  }
  void Rand2(List<dynamic> SearchArray) {
    i = 0;
    for (int i = 0; i < 10; i++) {
      int p = Random().nextInt(999);
      SearchArray[i] = p;
    }
    for(int i=0;i<9;i++)
      {
        for(int j=0;j<10-i-1;j++)
          {
            if(SearchArray[j]>SearchArray[j+1])
              {
                int temp=SearchArray[j];
                SearchArray[j]=SearchArray[j+1];
                SearchArray[j+1]=temp;
              }
          }
      }
  }

  Future<String> LinearSearch() async {
    y = 0;
    for (i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        if (key == SearchArray[i]) {
          y = 1;
        }
      });
      if (y == 1) {
        String result = "Number found at poistion " + (i + 1).toString();
        final snackBar = new SnackBar(
          content: new Text(
            result,
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 2),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
        i=0;
        return key;
      }
    }
    if (y == 0) {
      String result = "Number not found ";
      final snackBar = new SnackBar(
        content: new Text(result),
        duration: Duration(seconds: 1),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
    i=0;
    return '-1';
  }
Future<int> BinarySearch() async
{
  l=0;
  h=9;
    while(l<=h)
    {
      await Future.delayed(Duration(seconds: 1));
      mid=(l+h)~/2;
      setState(() {
        if(SearchArray2[mid]==key2)
        {
          m=1;
        }
        else if(SearchArray2[mid]>key2)
        {
          h=mid-1;
        }
        else if(SearchArray2[mid]<key2)
        {
          l=mid+1;
        }

      });
      if(m==1) {
        await Future.delayed(Duration(seconds: 1));
        String result = "Number found at position " + (mid+1).toString();
        final snackBar = new SnackBar(
          content: new Text(
            result,
            style: TextStyle(color: Colors.white),
          ),
          duration: Duration(seconds: 2),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
        m=0;
        return key2;
      }
    }
  String result = "Number not found ";
  final snackBar = new SnackBar(
    content: new Text(result),
    duration: Duration(seconds: 1),
  );
  _scaffoldKey.currentState.showSnackBar(snackBar);
    m=0;
    return z;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Algo Visualizer',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: PageView(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TyperAnimatedTextKit(
                  isRepeatingAnimation: true,
                    text: ["Linear Search"],
                    textStyle: GoogleFonts.bubblegumSans(
                      textStyle: TextStyle(
                          fontSize: 30.0,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    )),
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    SearchBox(
                      Sarray: SearchArray,
                      num: 0,
                      selColor: i == 0 ? Colors.lime : Colors.white,
                      wide: i == 0 ? 40.0 : 35.0,
                      decor: i > 0
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: i == 0 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox(
                      Sarray: SearchArray,
                      num: 1,
                      selColor: i == 1 ? Colors.lime : Colors.white,
                      wide: i == 1 ? 40.0 : 35.0,
                      decor: i> 1
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: i == 1 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox(
                      Sarray: SearchArray,
                      num: 2,
                      selColor: i == 2 ? Colors.lime : Colors.white,
                      wide: i == 2 ? 40.0 : 35.0,
                      decor: i > 2
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: i == 2 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox(
                      Sarray: SearchArray,
                      num: 3,
                      selColor: i == 3 ? Colors.lime : Colors.white,
                      wide: i == 3 ? 40.0 : 35.0,
                      decor: i > 3
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: i == 3 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox(
                      Sarray: SearchArray,
                      num: 4,
                      selColor: i == 4 ? Colors.lime : Colors.white,
                      wide: i == 4 ? 40.0 : 35.0,
                      decor: i > 4
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: i == 4 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox(
                      Sarray: SearchArray,
                      num: 5,
                      selColor: i == 5 ? Colors.lime : Colors.white,
                      wide: i == 5 ? 40.0 : 35.0,
                      decor: i > 5
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: i == 5 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox(
                      Sarray: SearchArray,
                      num: 6,
                      selColor: i == 6 ? Colors.lime : Colors.white,
                      wide: i == 6 ? 40.0 : 35.0,
                      decor: i > 6
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: i == 6 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox(
                      Sarray: SearchArray,
                      num: 7,
                      selColor: i == 7 ? Colors.lime : Colors.white,
                      wide: i == 7 ? 40.0 : 35.0,
                      decor: i > 7
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: i == 7 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox(
                      Sarray: SearchArray,
                      num: 8,
                      selColor: i == 8 ? Colors.lime : Colors.white,
                      wide: i == 8 ? 40.0 : 35.0,
                      decor: i > 8
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: i == 8 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox(
                      Sarray: SearchArray,
                      num: 9,
                      selColor: i == 9 ? Colors.lime : Colors.white,
                      wide: i == 9 ? 40.0 : 35.0,
                      decor: i > 9
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: i == 9 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.green,
                      border: OutlineInputBorder(),
                      labelText: "Enter the number to be searched",
                    ),
                    onSubmitted: (value) {
                      key = value;
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                    padding: EdgeInsets.all(1),
                    child: Image.asset('assets/images/LinearSearch.png'),
                  ),
                ),
                  
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                          child: Text(
                            "Search",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20),
                          ),
                          onPressed: () async {
                            var x = await LinearSearch();
                          },),
                    ),
                    Expanded(
                      child: FlatButton(
                        child: Text(
                          'Sort Info',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Information("Linear Search", m2["Linear Search"])));
                        },
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                          child: Text(
                            "Random",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              Rand(SearchArray);
                            });
                          }),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text("Swipe for Binary Search",
                          style: GoogleFonts.ubuntu(textStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.normal),)
                      ),
                      Icon(
                        Icons.forward,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                TyperAnimatedTextKit(
                  isRepeatingAnimation: true,
                    text: ["Binary Search"],
                    textStyle: GoogleFonts.bubblegumSans(
                      textStyle: TextStyle(
                          fontSize: 30.0,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    )),
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    SearchBox2(
                      Sarray: SearchArray2,
                      num: 0,
                      selColor: mid == 0 ? Colors.lime : Colors.white,
                      wide: mid == 0 ? 40.0 : 35.0,
                      decor: i > 0
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: mid == 0 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox2(
                      Sarray: SearchArray2,
                      num: 1,
                      selColor: mid == 1 ? Colors.lime : Colors.white,
                      wide: mid == 1 ? 40.0 : 35.0,
                      decor: i> 1
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: mid == 1 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox2(
                      Sarray: SearchArray2,
                      num: 2,
                      selColor: mid == 2 ? Colors.lime : Colors.white,
                      wide: mid == 2 ? 40.0 : 35.0,
                      decor: i> 2
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: mid == 2 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox2(
                      Sarray: SearchArray2,
                      num: 3,
                      selColor: mid == 3 ? Colors.lime : Colors.white,
                      wide: mid == 3 ? 40.0 : 35.0,
                      decor: i >3
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: mid == 3 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox2(
                      Sarray: SearchArray2,
                      num: 4,
                      selColor: mid == 4 ? Colors.lime : Colors.white,
                      wide: mid == 4 ? 40.0 : 35.0,
                      decor: i > 4
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: mid == 4 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox2(
                      Sarray: SearchArray2,
                      num: 5,
                      selColor: mid == 5 ? Colors.lime : Colors.white,
                      wide: mid == 5 ? 40.0 : 35.0,
                      decor: i >5
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: mid == 5 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox2(
                      Sarray: SearchArray2,
                      num: 6,
                      selColor: mid == 6 ? Colors.lime : Colors.white,
                      wide: mid == 6 ? 40.0 : 35.0,
                      decor: i > 6
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: mid == 6 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox2(
                      Sarray: SearchArray2,
                      num: 7,
                      selColor: mid == 7 ? Colors.lime : Colors.white,
                      wide: mid == 7 ? 40.0 : 35.0,
                      decor: i > 7
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: mid == 7 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox2(
                      Sarray: SearchArray2,
                      num: 8,
                      selColor: mid == 8 ? Colors.lime : Colors.white,
                      wide: mid == 8 ? 40.0 : 35.0,
                      decor: i >8
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: mid == 8 ? FontWeight.bold : FontWeight.normal,
                    ),
                    SearchBox2(
                      Sarray: SearchArray2,
                      num: 9,
                      selColor: mid == 9 ? Colors.lime : Colors.white,
                      wide: mid == 9 ? 40.0 : 35.0,
                      decor: i >9
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fbold: mid== 9 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.green,
                      border: OutlineInputBorder(),
                      labelText: "Enter the number to be searched",
                    ),
                    onSubmitted: (value) {
                       key2 = int.parse(value);
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                    padding: EdgeInsets.all(1),
                    child: Image.asset('assets/images/Binary-Search.png',),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: FlatButton(
                          child: Text(
                            "Search",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20),
                          ),
                          onPressed: () async {
                            var p = await BinarySearch();
                            print(p);
                          }),
                    ),
                    Expanded(
                      child: FlatButton(
                        child: Text(
                          'Sort Info',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Information("Binary Search", m2["Binary Search"])));
                        },
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                          child: Text(
                            "Random",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              Rand2(SearchArray2);
                            });
                          }),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Icon(
                        Icons.arrow_back,
                      ),
                      Text("Swipe for Linear Search",
                          style: GoogleFonts.ubuntu(textStyle:TextStyle(fontSize: 18, fontWeight: FontWeight.normal),)
                      ),
                    ],
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

class SearchBox2 extends StatelessWidget {
  SearchBox2({this.selColor,
    this.Sarray,
    this.num,
    this.wide,
    this.decor,
    this.fbold});
  final Color selColor;
  final List<int> Sarray;
  final dynamic num;
  final double wide;
  final TextDecoration decor;
  final FontWeight fbold;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: selColor,
          borderRadius: BorderRadius.circular(wide - 15),
        ),
        margin: EdgeInsets.only(left: 3, right: 3),
        child: Center(
          child: Text(
            Sarray[num].toString(),
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                decoration: decor,
                fontWeight: fbold),
          ),
        ),
      ),
    );
  }
}

class SearchBox extends StatelessWidget {
  SearchBox(
      {this.selColor,
      this.Sarray,
      this.num,
      this.wide,
      this.decor,
      this.fbold});
  final Color selColor;
  final List<String> Sarray;
  final int num;
  final double wide;
  final TextDecoration decor;
  final FontWeight fbold;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: selColor,
          borderRadius: BorderRadius.circular(wide - 15),
        ),
        margin: EdgeInsets.only(left: 3, right: 3),
        child: Center(
          child: Text(
            Sarray[num],
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                decoration: decor,
                fontWeight: fbold),
          ),
        ),
      ),
    );
  }
}
