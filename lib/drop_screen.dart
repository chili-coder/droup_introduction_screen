import 'package:droup_introduction_screen/home.dart';
import 'package:droup_introduction_screen/intro_pages/intro1.dart';
import 'package:droup_introduction_screen/intro_pages/intro2.dart';
import 'package:droup_introduction_screen/intro_pages/intro3.dart';
import 'package:droup_introduction_screen/intro_pages/intro4.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DropScreen extends StatefulWidget {
  const DropScreen({Key? key}) : super(key: key);

  @override
  State<DropScreen> createState() => _DropScreenState();
}

class _DropScreenState extends State<DropScreen> {
  PageController _controller=PageController();
  bool onLastPage=false;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){

              setState(() {
                onLastPage=(index==3);
              });
            },
            children: [
             Intro1(),
              Intro2(),
              Intro3(),
              Intro4(),


            ],
          ),
          Container(
              alignment: Alignment(0,0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                  onTap: (){
                    _controller.jumpToPage(3);
                  },
                      child: Text("Skip",style: TextStyle(fontWeight: FontWeight.bold))),
                  SmoothPageIndicator(controller: _controller, count: 4,effect: SlideEffect(
                      spacing:  8.0,
                      radius:  4.0,
                      dotWidth:  30.0,
                      dotHeight:  8.0,
                      paintStyle:  PaintingStyle.stroke,
                      strokeWidth:  1.5,
                      dotColor:  Colors.black12,
                      activeDotColor:  Colors.orange
                  ),  ),

                  ///
                  onLastPage?
                  GestureDetector(
                      onTap: (){
                       Navigator.push(context,
                       MaterialPageRoute(builder: (context){
                         return HomePage();
                       }));

                      },
                      child: Text("Done",style: TextStyle(fontWeight: FontWeight.bold),))
                      :GestureDetector(
                      onTap: (){
                        _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);

                      },
                      child: Text("Next",style: TextStyle(fontWeight: FontWeight.bold),)),
                ],
              )),
        ],
      ),
    );
  }
}
