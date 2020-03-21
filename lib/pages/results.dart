import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import './screens.dart';


import 'dart:convert'; 



class MoreData extends StatelessWidget {

  final List patientResults;
  const MoreData({Key key,@required this.patientResults,}): super(key:key);

  
  
 @override
    Widget build(BuildContext context) {
      return Scaffold(
        
        backgroundColor:  Colors.grey[200],
        appBar: AppBar(
          backgroundColor:  Colors.transparent,
          title: new Text("Patients Results", style: TextStyle(
            color: Colors.teal
          )
          ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 30, color: Colors.teal.withOpacity(0.65),),
            color: Colors.white, 
            onPressed: () {
              Navigator.pop(context);
            },tooltip: "back",
          ),
        ),
        bottomNavigationBar: GestureDetector(
        onTap:(){
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.only(left:200.0, right: 20.0, top: 8.0, bottom: 8.0),
          child: Container(
            width: 60,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.teal
              //border: Border.all(color: Colors.lightGreen[500].withOpacity(0.5), width: 1.0),
            ),
            child: Center(
              child: Text("Save",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
              )
          ),
          )
        ),
      ),

      body: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            child: Container(
              margin: EdgeInsets.only(left: 100.0),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    image: new AssetImage(
                      'assets/images/logo.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              height: 140.0,
              width: 100.0,
            ),
          ),
            Positioned(
                  top: 160,
                  child: Container(
                    margin: EdgeInsets.only(left: 80.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        text: "Name :   ",
                        children: <TextSpan>[
                          TextSpan(text: ' ${patientResults[0]}',style: TextStyle(color: Colors.teal ,fontSize: 22))
                        ],
                      ),
                    )
                  ),
                ),
                  Positioned(
                  top: 200,
                  child: Container(
                    margin: EdgeInsets.only(left: 80.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        text: "Risk Factor :    ",
                        children: <TextSpan>[
                          TextSpan(text: ' ${patientResults[1]}',style: TextStyle(color: Colors.teal ,fontSize: 22))
                        ],
                      ),
                    )
                  ),
                ),
                  Positioned(
                  top: 240,
                  child: Container(
                    margin: EdgeInsets.only(left: 80.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 20.0, color: Colors.black54),
                        text: "% :  ",
                        children: <TextSpan>[
                          TextSpan(text: ' ${patientResults[2]}',style: TextStyle(color: Colors.teal ,fontSize: 22))
                        ],
                      ),
                    )
                  ),
                ),
      ],),
      );
    }
}
