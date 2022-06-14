import 'package:flutter/material.dart';

class Intro3 extends StatelessWidget {
  const Intro3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset("assets/images/com.gif"),
            ), ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Text("If you are caring for yourself or a loved one at home,"
                  " how can you keep everyone safe? Who should be cared for at home? "
                  "How to prevent COVID-19 spread to other family members?",style: TextStyle(color: Colors.grey,fontSize: 15),),
            ),
            SizedBox(height: 120,)

          ],
        ),
      ),
    );
  }
}
