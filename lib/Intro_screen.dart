import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'home.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var RespHeight = MediaQuery.of(context).size.height;
    var RespWidth = MediaQuery.of(context).size.width;
    var height85 = RespHeight / 9.18;
    var height25 = RespHeight / 31.24;
    var Radius80 = RespHeight / 9.76;
    var Radius140 = RespHeight / 5.57;
    var Radius130 = RespHeight / 6.00;
    var FontSize30 = RespHeight / 26.03;
    var FontSize15 = RespHeight / 52.06;
    print('Height' + MediaQuery.of(context).size.height.toString());
    print('Wigth' + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: height85, bottom: height85),
        child: Center(
            child: Column(
          children: [
            Text(
              'Tic Tac Toe Game',
              style: TextStyle(
                fontSize: FontSize30,
                color: Color.fromARGB(255, 76, 175, 80),
                fontFamily: "Regular",
                
              ),
            ),
            Expanded(
                flex: 2,
                child: AvatarGlow(
                  glowColor: Colors.white,
                  endRadius: Radius140,
                  duration: Duration(milliseconds: 2000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 100),
                  child: Material(
                    shape: const CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.white60,
                      child: Image.asset(
                        'asset/images/t3.png',
                        height: Radius130,
                      ),
                      radius: Radius80,
                    ),
                  ),
                )),
            
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(height25),
                child: Container(
                  padding: EdgeInsets.all(height25),
                  color: Color.fromARGB(255, 244, 54, 124),
                  child: Text(
                    " PLAY GAME",
                    style: TextStyle(
                      fontSize: FontSize15,
                      color: Colors.black,
                      fontFamily: "Regular",
                      letterSpacing: 0,
                      
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
