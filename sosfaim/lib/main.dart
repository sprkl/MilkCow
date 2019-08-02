import 'package:flutter/material.dart';

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
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget> [
                new Container(
                  // A fixed-height child.
                  height: 40.0,
                  padding: const EdgeInsets.all(10.0),
                  child: new LinearProgressIndicator(
                    value: _progressValue,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                  )
                ),
                new Slider(
                  value: _progressValue,
                  onChanged: (value) {
                    setState(() => _progressValue = value);
                  }
                ),
                // new RaisedButton(
                //   elevation: 2,
                //   child: Text(''),
                //   onPressed: () {
                //     //Insert event to be fired up when button is clicked here
                //     //in this case, this increments our countValue variable by one.
                //     setState(() => _progressValue += 0.1);
                //   }
                // )
              ]
            ),
            new Container(
              // A fixed-height child.
              height: 40.0,
              padding: const EdgeInsets.all(10.0),
              child: new LinearProgressIndicator(
                value: _progressValue,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
              )
            ),
          ],
        ),
      )
   );
 }
}