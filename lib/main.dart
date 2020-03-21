import 'package:page_transition/page_transition.dart';
//import 'package:flutter/src/widgets/image.dart';
import 'package:flutter/material.dart';
import './pages/screens.dart';



void main() => runApp(
  MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.teal,
      primaryColorLight: Colors.white
    ),
    debugShowCheckedModeBanner: false,
    home: HomePage()
  )
);


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _scaleController;
  Animation<double> _scaleAnimation;

  bool hide = false;

  @override
  void initState(){
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700)
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 30.0
    ).animate(_scaleController)..addStatusListener((status) {
      if (status == AnimationStatus.completed){
        Navigator.push(context, PageTransition( type: PageTransitionType.rightToLeftWithFade , child: Menu())); // navigate to LandingPag
    }
  });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.teal]),
            ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Stack(
            children: <Widget>[
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
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
                    height: 250.0,
                    width: 200.0,
                  ),
               ),
                SizedBox(height:20),
                Center(
                  child: Text("Cervical Cancer App", 
                    style: TextStyle(
                      fontWeight: FontWeight.w400, 
                      color:Colors.white,
                      fontSize: 27)
                      ),
                ),
                SizedBox(height:80),
                InkWell(
                  onTap: (){
                    setState(() {
                      hide = true;
                      });
                    _scaleController.forward();
                    
                  },
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Center(
                        child: hide == false ? Text("Get Started", style: TextStyle(fontWeight: FontWeight.bold, color:Colors.teal.withOpacity(0.8))) : Container()
                        ),
                  ),
                 ),
                  ),
                ), 
              
                SizedBox(height:50),
              ],
            ),
            ],
            
          ),
        )
      )
      );
  }
}
