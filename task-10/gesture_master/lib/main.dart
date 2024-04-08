
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        centerTitle: true,
      backgroundColor: Colors.orangeAccent,
      title: const Text('GestureMaster',
      style: TextStyle(fontFamily: AutofillHints.organizationName, fontSize: 24,color: Colors.white)
      )
      ),
      body: Center(child: MyStackWidget(),),
      );
  }
}
class MyStackWidget extends StatefulWidget {
  MyStackWidget ({super.key});
  @override
  _MyStackWidgetState createState() => _MyStackWidgetState();
}

class _MyStackWidgetState extends State<MyStackWidget> {
bool selected = false;
double _x = 0;
double _y = 0;
double _rotation = 0;

@override
Widget build (BuildContext context){
 
return Stack (
  children: <Widget> [
    Positioned(
     top: _y,
     left: _x,
     child: RotationTransition(
      turns: AlwaysStoppedAnimation (_rotation),
       child: AnimatedContainer(
        decoration: BoxDecoration(
         color: selected ? Colors.green: Colors.orangeAccent,
         border: Border.all(color:Colors.transparent,width: 1),
         borderRadius: BorderRadius.circular(20),
        ),
        width: selected ? 200.0 : 100.0,
        height: selected ? 200.0 : 100.0,
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 400),
        ),
     ), 
   ),

   Positioned.fill(child:Center(
    
    child:GestureDetector(
     onTap: () {
      print ('I was tapped');
      setState(() {
          selected = !selected;
        });
    },

     onPanUpdate: (details) {
      print ('I was dragged');
       setState(() {
           _x += details.delta.dx;
           _y += details.delta.dy;
              });
     },
     onLongPress: () {
      print ('I was long pressed');
      setState(() {
          _rotation += 0.2;
              }); 
     },
      ),
   )
   ),
 ]
);
}
}

