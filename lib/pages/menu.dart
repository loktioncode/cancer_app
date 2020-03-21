import 'package:cancer_app/pages/data_capture.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import './screens.dart';


class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
     
      body: Column(
        children: <Widget>[
          ClipPath(
            child: Container(
              color: Colors.deepPurpleAccent.withOpacity(0.35),),
            clipper: getClipper(),
          ),
          Padding(
            padding: const EdgeInsets.only(top:100.0,bottom: 40),
            child: Text("MENU", textAlign:TextAlign.center,

            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.teal
            )
            )
          ),
          Center(
            child: Container(
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
          SizedBox(height:60),
          Padding(
            padding: const EdgeInsets.only(left:45.0, right: 45.0, bottom: 15.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.6),
                
              ),
              child: GestureDetector(
                 onTap: (){
                  Navigator.push(context, PageTransition( type: PageTransitionType.upToDown , child: CaptureData(), duration: Duration(milliseconds:60))); //to Capture Data
                },
                child: Center(
                  child: Text("CAPTURE DATA", style: TextStyle(fontWeight: FontWeight.bold, color:Colors.white)) 
                  ),
              ),
            ),
        ),
       
          Padding(
            padding: const EdgeInsets.only(left:45.0, right: 45.0),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.6),
                
              ),
              child: GestureDetector(
               onTap: (){
                 //code goes here
               },
                child: Center(
                  child: Text("EXPORT DATA", style: TextStyle(fontWeight: FontWeight.bold, color:Colors.white)) 
                  ),
              ),
            ),
        ),
    
        ]
      )
   
      );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.conicTo(40, 180, size.width + 100, -10, 1);
    //path.lineTo(0.0, size.height / 2);
    //path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
