import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void _showOverlay(BuildContext context) async {

    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(builder: (context){

      return Column(

        mainAxisSize: MainAxisSize.min,

        children: [

          SizedBox(height : MediaQuery.of(context).size.height * 0.3,),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Material(

              color: Color(0xFF4D4D4D),
              child: Column(

                children: [

                  Container(

                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 57,
                      child : TextField(

                        style: TextStyle(color: Color(0xFFABABAB)),
                          decoration: InputDecoration(

                              border: OutlineInputBorder(

                                  borderRadius: BorderRadius.circular(10)

                              ),
                              fillColor: Color(0x557C7B7B),
                              filled: true

                          ),

                        )
                  ),
                  SizedBox(height : MediaQuery.of(context).size.width * 0.08),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 57,
                    child: TextField(

                          style: TextStyle(color: Color(0xFFABABAB)),
                          decoration: InputDecoration(

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              fillColor: Color(0x557C7B7B),
                              filled: true

                          ),

                      )
                  ),
                  SizedBox(height : 20),
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      Row(

                        children: [

                          Checkbox(value: true, onChanged: (value){ value = !value!;}),
                          Text("保持登入", style: TextStyle(fontSize: 15, color: Color(0xFFFFFFFF)),),

                        ],

                      ),
                      Text("忘記密碼 ?", style: TextStyle(fontSize: 15, color: Color(0xFFFFFFFF)),)

                    ],

                  ),
                  SizedBox(height : 50),
                  TextButton(


                      child: Container(

                        color: Color(0xFF7B6DD6),
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 40,
                        child: Center(child: Text("登入",textAlign: TextAlign.center,style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 18),)),

                      ),
                      onPressed: (){



                      }
                  ),
                  SizedBox(height : 50),
                ],

              ),



            ),


          )

        ],
      );


    });

    print(overlayEntry);
    overlayState?.insert(overlayEntry);

  }

  @override
  void initState() {


    super.initState();
    Future.delayed(const Duration(microseconds: 1000), (){

      _showOverlay(context);

    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Material(
      color: Color(0xFF4D4D4D),

          child : CustomPaint(

            size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
            painter: MyPainter(MediaQuery.of(context).size.width,MediaQuery.of(context).size.height),

          )


      ),

    );


  }
}

class MyPainter extends CustomPainter{

  double Width = 0.0, Height = 0.0;

  MyPainter(double w, double h){

    Width = w;
    Height = h;

  }

  @override
  void paint(Canvas canvas, Size size){
    
    print(size);
    drawRect(canvas);
    

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void drawRect(Canvas canvas){
    
    final paint = Paint()
        ..isAntiAlias = true
        ..style = PaintingStyle.fill
        ..color = Color(0xFFA4DFDA);



    final paint3 = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0xFF819FA4);





    final double SideLength = Width/2 * sqrt(2) * max(0.8, 1.1- Width/Height);
    canvas.save();
    var path = Path()
      ..moveTo(-10, -10)
      ..lineTo(SideLength * sqrt(2)/2 + 15 ,-10)
      ..lineTo(-10, SideLength * sqrt(2)/2 + 15);

    canvas.drawShadow(path, Color(0xFF000000), 10, false);
    canvas.restore();


    canvas.save();
    var rect = Offset.zero & Size(SideLength,SideLength);
    canvas.translate(-SideLength/2, -SideLength/2);
    rotate(canvas, rect.width, rect.height, 45 * 3.14/180);
    canvas.drawRect(rect, paint);

    canvas.restore();



    canvas.save();
    var path2 = Path()
      ..moveTo(Width + 10, Height + 10)
      ..lineTo(Width - 100 , Height + 10)
      ..lineTo(Width + 10 , Height-80);

    canvas.drawShadow(path2, Color(0xFF000000), 10, false);
    canvas.restore();

    canvas.save();
    var rect3 = Offset.zero & Size(100,100);
    canvas.translate(Width - 52, Height - 40);
    rotate(canvas, rect3.width, rect3.height, 50 * 3.14/180);
    canvas.drawRect(rect3, paint3);

    canvas.restore();

    
  }

  void rotate(Canvas canvas, double dx, double dy, double angle){

    final r = sqrt(dx*dx + dy*dy)/2;
    final alpha = atan(dx / dy);
    final beta = alpha + angle;
    final shiftY = r * sin(beta);
    final shiftX = r * cos(beta);
    final translateX = dx / 2 - shiftX;
    final translateY = dy / 2 - shiftY;
    canvas.translate(translateX, translateY);
    canvas.rotate(angle);

  }

}
