import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:algovisual/Info.dart';

class Sorting extends StatefulWidget {
  @override
  _SortingState createState() => _SortingState();
}

class _SortingState extends State<Sorting> {
  int i = 0, j = 0, speed = 100;
  var SortStyle = ["Bubble Sort", "Insertion Sort", "Selection Sort"];
  var DispText = "Bubble Sort";

  List<dynamic> numArray = [
    100.0,
    150.0,
    200.0,
    50.0,
    400.0,
    350.0,
    200.0,
    345.0,
    30.0,
    134.0,
    298.0,
    120.0,
    230.0,
    435.0,
    510.0,
    20.0,
    45.0,
    190.0,
    469.0,
    145.0
  ];
  Map<String, String> m1 = {
    "Bubble Sort":
        "Bubble Sort is the simplest sorting algorithm that works by repeatedly swapping the adjacent elements if they are in wrong order.\n\nWorst and Average Case Time Complexity: O(n*n).\n\nWorst case occurs when array is reverse sorted.Best Case Time Complexity: O(n).\n\nBest case occurs when array is already sorted.\n\nAuxiliary Space: O(1),(Auxiliary Space is the extra space or temporary space used by an algorithm.)\n\nBoundary Cases: Bubble sort takes minimum time (Order of n) when elements are already sorted.\n\nSorting In Place: Yes(An in-place algorithm is an algorithm that does not need an extra space and produces an output in the same memory that contains the data by transforming the input ‘in-place’. However, a small constant extra space used for variables is allowed.)\n\nStable: Yes(A sorting algorithm is said to be stable if two objects with equal keys appear in the same order in sorted output as they appear in the input array to be sorted.)",
    "Selection Sort":
        " The selection sort algorithm sorts an array by repeatedly finding the minimum element (considering ascending order) from unsorted part and putting it at the beginning. The algorithm maintains two subarrays in a given array.\n\nTime Complexity: O(n*2) as there are two nested loops.\n\nAuxiliary Space: O(1),(Auxiliary Space is the extra space or temporary space used by the algorithm).\n\nSorting In Place: Yes,(An in-place algorithm is an algorithm that does not need an extra space and produces an output in the same memory that contains the data by transforming the input ‘in-place’. However, a small constant extra space used for variables is allowed.)\n\nStable: Yes or No, Depends upon the looping condition",
    "Insertion Sort":
        " Insertion sort is a simple sorting algorithm that works the way we sort playing cards in our hands.\n\nTime Complexity: O(n*2).\n\nAuxiliary Space: O(1),(Auxiliary Space is the extra aur temporary space used by the algorithm)\n\nBoundary Cases: Insertion sort takes maximum time to sort if elements are sorted in reverse order. And it takes minimum time (Order of n) when elements are already sorted.\n\nSorting In Place: Yes,(An in-place algorithm is an algorithm that does not need an extra space and produces an output in the same memory that contains the data by transforming the input ‘in-place’. However, a small constant extra space used for variables is allowed.)\n\nStable: Yes(A sorting algorithm is said to be stable if two objects with equal keys appear in the same order in sorted output as they appear in the input array to be sorted.)"
  };
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void Rand(List<dynamic> numArray) {
    for (int i = 0; i < 20; i++) {
      double x = Random().nextDouble() * 500;
      numArray[i] = x;
    }
  }

  void SortArray(List<dynamic> numArray) async {
    double temp = 0.0;
    for (i = 0; i < 19; i++) {
      for (j = 0; j < 20 - i - 1; j++) {
        await Future.delayed(Duration(microseconds: speed));
        if (numArray[j] > numArray[j + 1]) {
          setState(() {
            temp = numArray[j];
            numArray[j] = numArray[j + 1];
            numArray[j + 1] = temp;
          });
        }

        await Future.delayed(Duration(microseconds: (speed * 5)));
      }
      if(i==18)
        {
            final snackBar = new SnackBar(content: new Text("Sorting completed"),duration: Duration(seconds: 1),);

            _scaffoldKey.currentState.showSnackBar(snackBar);

        }
    }
    i = 0;
    j = 0;
  }

  void insertionSort(List<dynamic> numArray) async {
    int i, j;
    double key;
    await Future.delayed(Duration(microseconds: speed * 2));
    for (i = 1; i < 20; i++) {
      await Future.delayed(Duration(microseconds: speed * 2));
      key = numArray[i];
      j = i - 1;
      while (j >= 0 && numArray[j] > key) {
        await Future.delayed(Duration(microseconds: speed * 2));
        setState(() {
          double temp = numArray[j];
          numArray[j] = numArray[j + 1];
          numArray[j + 1] = temp;
        });
        await Future.delayed(Duration(microseconds: speed * 2));
        j = j - 1;
      }
      numArray[j + 1] = key;
      if(i==19)
      {
        final snackBar = new SnackBar(content: new Text("Sorting completed"),duration: Duration(seconds: 1),);

        _scaffoldKey.currentState.showSnackBar(snackBar);

      }
    }
  }

  void selectionSort(List<dynamic> numArray) async {
    int speedx = (speed / 10).toInt();
    for (int i = 0; i < 20 - 1; i++) {
      int minIdx = i;
      for (int j = i + 1; j < 20; j++) {
        await Future.delayed(Duration(milliseconds: speedx));
        if (numArray[j] < numArray[minIdx]) minIdx = j;
      }
      await Future.delayed(Duration(milliseconds: speedx));
      setState(() {
        double temp = numArray[minIdx];
        numArray[minIdx] = numArray[i];
        numArray[i] = temp;
      });
      if(i==18)
      {
        final snackBar = new SnackBar(content: new Text("Sorting completed"),duration: Duration(seconds: 1),);

        _scaffoldKey.currentState.showSnackBar(snackBar);

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'ALGO-VISUALIZER',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.red[300],
                Colors.red[600],
                Colors.red[900],
              ]
            )
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ExpandedBars(
                    numArray: numArray,
                    height: 0,
                    dispColor: Colors.white,
                  ),
                  ExpandedBars(
                      numArray: numArray, height: 1, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 2, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 3, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 4, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 5, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 6, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 7, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 8, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 9, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 10, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 11, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 12, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 13, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 14, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 15, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 16, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 17, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 18, dispColor: Colors.white),
                  ExpandedBars(
                      numArray: numArray, height: 19, dispColor: Colors.white),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: FlatButton(
                      child: Text(
                        'Random',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          Rand(numArray);
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: Slider(
                      value: speed.ceilToDouble(),
                      onChanged: (val) {
                        setState(() {
                          speed = val.floor();
                        });
                      },
                      activeColor: Colors.white,
                      inactiveColor: Colors.black,
                      max: 1000,
                      min: 100,
                    ),
                  ),
                  Expanded(
                      child: DropdownButton<String>(
                    dropdownColor: Colors.redAccent,
                    items: SortStyle.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(
                          dropDownStringItem,
                          style: TextStyle(color: Colors.yellow),
                        ),
                      );
                    }).toList(),
                    onChanged: (String newValueSelected) {
                      setState(() {
                        DispText = newValueSelected;
                        if (DispText == SortStyle[0]) {
                          SortArray(numArray);
                        } else if (DispText == SortStyle[1]) {
                          insertionSort(numArray);
                        } else if (DispText == SortStyle[2]) {
                          selectionSort(numArray);
                        }
                      });
                    },
                    value: DispText,
                  )),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FlatButton(
                        child: Text(
                          'Sort Info',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Information(DispText, m1[DispText])));
                        },
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        child: Text(
                          'Back',
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),
                        ),
                        onPressed: ()
                        {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandedBars extends StatelessWidget {
  ExpandedBars({this.numArray, this.height, this.dispColor});

  final List numArray;
  final int height;
  final Color dispColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: dispColor,
        margin: EdgeInsets.only(left: 0.5,right: 0.5),
        height: numArray[height],
      ),
    );
  }
}
