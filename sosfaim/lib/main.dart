import 'package:flutter/material.dart';
import 'package:sosfaim/widgets/resourceWidget.dart';

void main() {
 runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return new MaterialApp(
     title: 'Sample App',
     theme: new ThemeData(
       primarySwatch: Colors.teal,
     ),
     home: new SampleAppPage(),
   );
 }
}

class SampleAppPage extends StatefulWidget {
 SampleAppPage({Key key}) : super(key: key);
 @override
 _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
 List widgets = [];
 int dayCount = 1;
 double _progressValue = 0.0;

 @override
 void initState() {
   super.initState();
 }
 
 @override
 Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Jour $dayCount"),
     ),
     body:
       new ListView.builder(
         itemCount: 1,
         itemBuilder: (BuildContext context, int position) {
           return new Column(
            //  children: [
            //    new Container(
            //      height: 30,
            //      child: new Padding(
            //        padding: const EdgeInsets.all(10.0),
            //        child: new Container(
            //          child: new LinearProgressIndicator(
            //            value: _progressValue,
            //            backgroundColor: Colors.grey,
            //            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
            //          ),
            //        ),
            //      ),
            //    ),
            //    new Container(
            //      height: 60,
            //      child:  Padding(
            //        padding: const EdgeInsets.all(10.0),
            //        child: new RaisedButton(
            //          child: Text('Click Button'),
            //          onPressed: () {
            //            //Insert event to be fired up when button is clicked here
            //            //in this case, this increments our countValue variable by one.
            //            setState(() => _progressValue += 0.1);
            //          },
            //        ),
            //      ),
            //    )
            //]
            children: [
              new ResourceWidget(
                0.25,
                "Vaches"
              ),
              new ResourceWidget(
                0.50,
                "Eau"
              )
            ],
           );
         })
   );
 }
}