import 'dart:math';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
const kTileHeight = 50.0;
const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);
const todoColor = Color(0xffd1d2d7);

class ProcessTimeline extends StatefulWidget {
  @override
  _ProcessTimelineState createState() => _ProcessTimelineState();

 late List<String> _process;
 double processIndex = 0;
 double _percentageValue = 0;
 Widget? _centerTitlePercentage;

  ProcessTimeline( {Key? key, required List<String> process,  int ? processIndex , double percentageValue  = 0,Widget? centerTitlePercentage}) : super(key: key){
    _process  = process;
    _percentageValue = percentageValue;
    this.processIndex = (processIndex??0).toDouble();
    _centerTitlePercentage = centerTitlePercentage;
    if(this.processIndex! == 2)
    {
        _percentageValue = 1;
    }
    if(this.processIndex! == 1)
    {
         _percentageValue = 0.58;
    }
    if(this.processIndex! == 0)
    {
         _percentageValue = (_percentageValue/2) +0.12;
    }
  }
}

class _ProcessTimelineState extends State<ProcessTimeline> {
  

  Color getColor(int index) {
  
    if (index == widget.processIndex) {

      return inProgressColor;
    } else if (index < widget.processIndex) {
      return completeColor;
    } else {

      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack (
      
      children: [ Timeline.tileBuilder(
          theme: TimelineThemeData(
      
            direction: Axis.horizontal,
            connectorTheme: const ConnectorThemeData(
              space: 30.0,
              thickness: 5.0,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemExtentBuilder: (_, __) =>
                MediaQuery.of(context).size.width / widget._process.length,
            oppositeContentsBuilder: (context, index) {
              return  const Padding(
                padding:  EdgeInsets.only(bottom: 15.0),
                
              );
            },
            contentsBuilder: (context, index) {
              return Container(
                
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    widget._process[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: getColor(index),
                    ),
                  ),
                ),
              );
            },
            // contentsBuilder: (_, index) {
            //         if (index == widget._process.length) return null;
            
            //         return Container(
            //           width: MediaQuery.of(context).size.width/3,
            //           child: Padding(
            //             padding: EdgeInsets.only(left: 8.0),
            //             child: Stack(
            //               children: [
            //                  Text(
            //                   widget._process[index],
            //                   style: DefaultTextStyle.of(context).style.copyWith(
            //                         fontSize: 18.0,
            //                       ),
                                
            //                 ),
            //                 Positioned(child: Icon(Icons.fire_truck),left: 40,)
            //               ],
            //             )
            //           ),
            //         );
            //       },
            indicatorBuilder: (_, index) {
              var color;
              var child;
              var sizeTodoIndicator = const Size(15.0, 15.0);
              var size = 30.0;
              if (index == widget.processIndex) {
                 color = inProgressColor;
                 
                  child =  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: index == widget._process.length -1? const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15.0,
                ) : const CircularProgressIndicator(
                    strokeWidth: 3.0,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                );

              } else if (index < widget.processIndex) {
                color = completeColor;
                child = const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 15.0,
                );
              } else {
                   if(widget.processIndex == 0 && index ==1 && widget._centerTitlePercentage!=null ){
                        size = 35.0;
                      child =  Padding(
                      padding:const  EdgeInsets.all(8.0),
                      child:  FittedBox(child:widget._centerTitlePercentage),
                    );
                    sizeTodoIndicator = const Size(30, 30);
                }
                color = todoColor;
              }
    
              if (index <= widget.processIndex) {
                return Stack(
                  children: [
                    CustomPaint(
                      size: const Size(30.0, 30.0),
                      painter: _BezierPainter(
                        color: color,
                        drawStart: index > 0,
                        drawEnd: index < widget.processIndex,
                      ),
                    ),
                    DotIndicator(
                      size:size,
                      color: color,
                      child: child,
                    ),
    
                  ],
                );
              } else {
                return Stack(
                  children: [
    
                    CustomPaint(
                      size: sizeTodoIndicator,
                      painter: _BezierPainter(
                        color: color,
                        drawEnd: index < widget._process.length - 1,
                      ),
                    ),
                  widget.processIndex == 0 && index ==1 && widget._centerTitlePercentage!=null?  
                  DotIndicator(
                      size:size,
                      color: color,
                      child: child,
                    ):
                  OutlinedDotIndicator(
                      borderWidth: 4.0,
                      color: color,
                    )
                     
                    
                  ],
                );
              }
            },
            
            connectorBuilder: (_, index, type) {
              if (index > 0) {
                if (index == widget.processIndex) {
                  final prevColor = getColor(index - 1);
                  final color = getColor(index);
                  List<Color> gradientColors;
                  if (type == ConnectorType.start) {
                    gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
                  } else {
                    gradientColors = [
                      prevColor,
                      Color.lerp(prevColor, color, 0.5)!
                    ];
                  }
                  return  Stack(
                    children: [
                      Positioned(
                        child: DecoratedLineConnector(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientColors,
                          ),
                        ),
                        
                        ),
                      ),
                      
                    ],
                  );  
                } else {
                  return SolidLineConnector(
                    color: getColor(index),
                  );
                }
              } else {
                return null;
              }
            },
            itemCount: widget._process.length,
      
          ),
        ),
      Positioned(
        child:   Visibility(
           visible: widget.processIndex < widget._process.length-1,
          child: Icon(Icons.fire_truck,color: Color(0xFF4e3aa9),)),
      left:  calculateTruck()),
    ]);
  }
  double calculateTruck(){
    return (((MediaQuery.of(context).size.width / widget._process.length) * 0.50) * 5) * widget._percentageValue;
  }
}

/// hardcoded bezier painter
/// TODO: Bezier curve into package component
class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}
