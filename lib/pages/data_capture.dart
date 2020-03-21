
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import './screens.dart';

import 'dart:async';
import 'dart:convert'; 


class CaptureData extends StatefulWidget {
  CaptureData({Key key}) : super(key: key);

  @override
  _CaptureDataState createState() => _CaptureDataState();
}

class _CaptureDataState extends State<CaptureData> {

  final Map<String, dynamic> patientData = {
    'name': null,
    'dob': null,
    'age': null,
    'sexualpartners': null,
    'firstime': null,
    'pregnancies': null,
    'smokeyears': null,
    'smokepacks': null,
    'contraceptives': null,
    'iud': null,
    'std': null,
    'dxcancer': null,
    'dxcin': null,
    'hpv': null,
    };

  //this async func will get data from the internet
  //when our func is done we return a string
  Future<String> postData() async {

  // set up POST request arguments
  String url = 'http://mpumx.pythonanywhere.com/patientdata';
  Map<String, String> headers = {"Content-type": "application/json"};

  String my_data = json.encode(patientData);


  // make POST request
  final res = await http.post(url, headers: headers, body: my_data);
  final Map results = json.decode(res.body);

  var patientResults = new List();
  
  results.forEach((key, value) => patientResults.add(value));

  Navigator.push(context, PageTransition( type: PageTransitionType.rightToLeftWithFade , child: MoreData(patientResults:patientResults))); 


}

  

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Widget _buildAgeField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.withOpacity(0.5))
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.teal, width: 1.8)
        ),
        labelText:'Age', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'Age Required';
        }
      },
      //set state on saved
      onSaved: (String value){
        patientData['age'] = value;
      },
    );
  }

    Widget _buildNameField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.withOpacity(0.5))
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.teal, width: 1.8)
        ),
        labelText:'Name', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'Name Required';
        }
      },
      //set state on saved
      onSaved: (String value){
        patientData['name'] = value;
      },
    );
  }

  Widget _buildSmokeYearsField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.withOpacity(0.5))
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.teal, width: 1.8)
        ),
        labelText:'Smoke Years', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'Smoke Years Required';
        }
      },
      //set state on saved
      onSaved: (String value){
       
        patientData['smokeyears'] = value;
      },
    );
  }

  Widget _buildPregnanciesField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.withOpacity(0.5))
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.teal, width: 1.8)
        ),
        labelText:'No. Pregnancies', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'No. Pregnancies Required';
        }
      },
      //set state on saved
      onSaved: (String value){
        patientData['pregnancies'] = value;
      },
    );
  }

  Widget _buildFirstSexField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.withOpacity(0.5))
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.teal, width: 1.8)
        ),
        labelText:'First Sexual Intercourse', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'information is required';
        }
      },
      //set state on saved
      onSaved: (String value){
        
        patientData['firsttime'] = value;
      },
    );
  }

  Widget _buildSexualPartnersField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.withOpacity(0.5))
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.teal, width: 1.8)
        ),
        labelText:'No. sexual partners ', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'No. sexual partners';
        }
      },
      //set state on saved
      onSaved: (String value){
        
        patientData['sexualpartners'] = value;
      },
    );
  }

  Widget _buildDobField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.withOpacity(0.5))
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.teal, width: 1.8)
        ),
        labelText:'D.O.B', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'Date of birth Required';
        }
      },
      //set state on saved
      onSaved: (String value){
       
        patientData['dob'] = value;
      },
    );
  }

  
  Widget _buildHpvField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.withOpacity(0.5))
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.teal, width: 1.8)
        ),
        labelText:'HPV', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'HPV Required';
        }
      },
      //set state on saved
      onSaved: (String value){
       
        patientData['hpv'] = value;
      },
    );
  }

  
  Widget _buildDxCinField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.withOpacity(0.5))
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.teal, width: 1.8)
        ),
        labelText:'Dx: Cin', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'Dx: cin required';
        }
      },
      //set state on saved
      onSaved: (String value){
        
        patientData['dxcin'] = value;
      },
    );
  }

  
  Widget _buildDxCancerField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.withOpacity(0.5))
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.teal, width: 1.8)
        ),
        labelText:'Dx: Cancer', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'Dx Cancer Required';
        }
      },
      //set state on saved
      onSaved: (String value){
        
        patientData['dxcancer'] = value;
      },
    );
  }

  
  Widget _buildStdField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.withOpacity(0.5))
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.teal, width: 1.8)
        ),
        labelText:'STDs No.', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'STDs No. Required';
        }
      },
      //set state on saved
      onSaved: (String value){
        
        patientData['std'] = value;
      },
    );
  }

  
  Widget _buildIudField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.withOpacity(0.5))
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.teal, width: 1.8)
        ),
        labelText:'IUD yrs', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'IUD yrs Required';
        }
      },
      //set state on saved
      onSaved: (String value){
        
        patientData['uid'] = value;
      },
    );
  }

  
  Widget _buildContraceptivesField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.withOpacity(0.5))
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.teal, width: 1.8)
        ),
        labelText:'Hormonal Contraceptives', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'Hormonal Contraceptives Required';
        }
      },
      //set state on saved
      onSaved: (String value){
        
        patientData['contraceptives'] = value;
      },
    );
  }

  
  Widget _buildSmokePacksField(){
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.grey.withOpacity(0.5))
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:BorderSide(color: Colors.teal, width: 1.8)
        ),
        labelText:'Smoke Packs/yr', 
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600 ),
         ),
      validator: (String value){
        if (value.isEmpty) {
          return 'No. smoke packs required';
        }
      },
      //set state on saved
      onSaved: (String value){
        
        patientData['smokepacks'] = value;
      },
    );
  }

  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:  Colors.grey[200],
      appBar: AppBar(
        backgroundColor:  Colors.transparent,
         title: new Text("Capture Patient Data", style: TextStyle(
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
      bottomNavigationBar: GestureDetector( //this is next button
      onTap:(){
        // saving the dart form
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save(); //onSaved is called!
          postData();
          //opening next page
        
        } 
      },
      child: Padding(
        padding: const EdgeInsets.only(left:200.0, right: 20.0, top: 8.0, bottom: 8.0),
        child: Container(
          width: 60,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.teal
            
          ),
          child: Center(
            child: Text("Next>>",
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
          Container(
            
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: ListView(
                children: <Widget>[

                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        _buildNameField(),
                        Row(
                          children: [
                            Expanded(child: Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: _buildDobField(),
                            ),),
                            Expanded(child: _buildAgeField(),),
                          ]
                        ),
                        _buildSexualPartnersField(),
                        _buildFirstSexField(),
                        Row(
                        children: [
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(right:8.0),
                            child: _buildPregnanciesField(),
                          ),),
                          Expanded(child: _buildSmokeYearsField(),),
                        ]
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildContraceptivesField(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(child: Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: _buildIudField(),
                            ),),
                            Expanded(child: _buildStdField(),),
                          ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(child: Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: _buildDxCancerField(),
                            ),),
                            Expanded(child: _buildDxCinField(),),
                          ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildHpvField(),
                      ),
                      ],
                
                    )
                  ),
                 
                ],
              ),
            ),
            
          ),
        
        ],
      ),
    );
  }
}

