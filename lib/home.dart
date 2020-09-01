import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({@required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      width: double.infinity,
      child: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           _showImage(),

           RaisedButton.icon(label: Text('Capture Image'),icon: Icon(Icons.camera_alt),onPressed: (){
             _choose(true);
           },),
         ],
       ),

      ),
    );
  }

  void _choose(bool _selectCamera) async {
    File tempFile;
    if (_selectCamera) {
      tempFile = await ImagePicker.pickImage(source: ImageSource.camera,imageQuality: 60,maxWidth: 600,maxHeight: 800 );
      setState(() {
        file = tempFile;
      });
    } else {
      tempFile = await ImagePicker.pickImage(source: ImageSource.gallery,imageQuality: 60,maxWidth: 600,maxHeight: 800);
      setState(() {
        file = tempFile;
      });
    }
  }

 Widget _showImage() {

    return            file!=null? Container(
      width: MediaQuery.of(context).size.width/3,
      height: MediaQuery.of(context).size.width/3,
      child: Image.file(file),
      decoration: new BoxDecoration(
        border: Border.all(width: 1.5,color: Theme.of(context).scaffoldBackgroundColor.computeLuminance()>0.5?Colors.grey:Colors.black),
      ),
    ):Container(
      width: MediaQuery.of(context).size.width/3,
      height: MediaQuery.of(context).size.width/3,
      child: Text('Previous Unavailable.'),
      decoration: new BoxDecoration(
        border: Border.all(width: 1.5,color: Theme.of(context).scaffoldBackgroundColor.computeLuminance()>0.5?Colors.grey:Colors.black),
      ),
    );
 }
}
