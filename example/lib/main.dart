/// Copyright (c) 2020 arconsis IT-Solutions GmbH
/// Licensed under MIT (https://github.com/arconsis/measurements/blob/master/LICENSE)

import 'package:document_measure/document_measure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class MetadataRepository {}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static String originalTitle = 'Measurement app';
  String title = originalTitle;
  bool measure = true;
  bool showDistanceOnLine = true;
  bool showTolerance = false;
  bool zoomed = false;

  List<LengthUnit> unitsOfMeasurement = [
    Meter.asUnit(),
    Millimeter.asUnit(),
    Inch.asUnit(),
    Foot.asUnit()
  ];
  int unitIndex = 0;

  MeasurementController controller = MeasurementController();

  @override
  void initState() {
    super.initState();

  }

  Color getButtonColor(bool selected) {
    if (selected) {
      return selectedColor;
    } else {
      return unselectedColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: <Widget>[
              IconButton(
                onPressed: () => setState(() {
                  measure = !measure;
                  title = originalTitle;
                }),
                icon: Icon(
                  Icons.straighten,
                  color: getButtonColor(
                    measure,
                  ),
                ),
              ),
              IconButton(
                onPressed: () =>
                    setState(() => showDistanceOnLine = !showDistanceOnLine),
                icon: Icon(
                  Icons.vertical_align_bottom,
                  color: getButtonColor(showDistanceOnLine),
                ),
              ),
              SizedBox.fromSize(
                child: MaterialButton(
                  shape: CircleBorder(),
                  onPressed: () =>
                      setState(() => showTolerance = !showTolerance),
                  child: Text('±'),
                  textColor: getButtonColor(showTolerance),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                size: Size(52, 52),
              ),
              SizedBox.fromSize(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(4.0) ),
                  onPressed: () => setState(() =>
                      unitIndex = (unitIndex + 1) % unitsOfMeasurement.length),
                  child: Text(unitsOfMeasurement[unitIndex].getAbbreviation()),
                  textColor: unselectedColor,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                size: Size(64, 64),
              ),
              IconButton(
                  onPressed: () {
                    if (zoomed) {
                      controller.resetZoom();
                    } else {
                      controller.zoomToLifeSize();
                    }

                    setState(() {
                      zoomed = !zoomed;
                    });
                  },
                  icon:
                      Icon(Icons.zoom_out_map, color: getButtonColor(zoomed))),
                      IconButton(
                onPressed: () {
                  controller.clear();
                  setState(() {
                    
                  });
                }
                    ,
                icon: Icon(
                  Icons.delete,
                  color: getButtonColor(showDistanceOnLine),
                ),
              ),
            ],
          ),
        ),
        body:  Measurements(
            child: Center(child: Image.asset('assets/images/tech_draw.png'),),
            deleteChild: Container(
            // child: Icon(
            //   Icons.delete,
            //   color: Colors.red,
            // ),
            // margin: EdgeInsets.only(bottom: 40),
          ),
            measurementInformation: MeasurementInformation(
              scale: 1 / 1.0,
              documentWidthInLengthUnits: Millimeter(448),
              documentHeightInLengthUnits: Millimeter(449),
              targetLengthUnit: unitsOfMeasurement[unitIndex],
            ),
            
            controller: controller,
            showDistanceOnLine: showDistanceOnLine,
            distanceStyle: DistanceStyle(
              showTolerance: showTolerance,
            ),
            measure: measure,
          ),
        
      ),
    );
  }
}
