import 'package:flutter/material.dart';

class ResourceWidget extends StatefulWidget{
  final double progressValue;
  final String resourceName;

  ResourceWidget(this.progressValue, this.resourceName);
  
  @override
  State<StatefulWidget> createState() => new ResourceWidgetState(progressValue, resourceName);
}

class ResourceWidgetState extends State<ResourceWidget>{
  double progressValue = 0.0;
  String resourceLabel;

  ResourceWidgetState(this.progressValue, this.resourceLabel);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Align(
               alignment: Alignment.centerLeft,
               child: Text(
                resourceLabel,
                textAlign: TextAlign.left),)
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:  LinearProgressIndicator(
              value: progressValue,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),)
            )
         ],
       )
    );
  }
}