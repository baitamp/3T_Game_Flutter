import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// String Display = '';
  List<String> Display = ['', '', '', '', '', '', '', '', ''];

  bool firstPlayer = true;

  var Fornts = TextStyle(color: Colors.white, fontSize: 25);

  int Player0 = 0;
  int PlayerX = 0; 
  var lastPlayer = '';

  @override
  Widget build(BuildContext context) {
    var RespHeight = MediaQuery.of(context).size.height;
    var RespWidth = MediaQuery.of(context).size.width;

    var height15 = RespHeight / 52.06;
    var height40 = RespHeight / 19.52;
    var height50 = RespHeight / 15.62;
    var height25 = RespHeight / 31.24;
    var Radius80 = RespHeight / 9.76;
    var Radius140 = RespHeight / 5.57;
    var Radius130 = RespHeight / 6.00;
    var FontSize20 = RespHeight / 39.05;
    var FontSize40 = RespHeight / 19.52;
    var FontSize30 = RespHeight / 26.03;
    var FontSize35 = RespHeight / 22.31;
    var FontSize15 = RespHeight / 52.06;
    

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: height50, bottom: height40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Scoreboard",
              style: TextStyle(
                fontSize: FontSize35,
                color: Colors.green,
                fontFamily: "Regular",
                letterSpacing: 0,
              ),
            ),
            SizedBox(
              height: height15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column( //ฟ้อนต์O
                  children: [
                    Text(
                      'Player 0',
                      style: TextStyle(
                        fontSize: FontSize15,
                        color: Colors.orange,
                        fontFamily: "Regular",
                        letterSpacing: 0,
                      ),
                    ),
                    SizedBox(height: height15),
                    Text(
                      Player0.toString(),
                      style: TextStyle(
                        fontSize: FontSize15,
                        color: Colors.orange,
                        fontFamily: "Regular",
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
                Column( //ฟ้อนต์X
                  children: [
                    Text('Player X',
                        style: TextStyle(
                          fontSize: FontSize15,
                          color: Colors.blue,
                          fontFamily: "Regular",
                          letterSpacing: 0,
                        )),
                    SizedBox(height: height15),
                    Text(
                      PlayerX.toString(),
                      style: TextStyle(
                        fontSize: FontSize15,
                        color: Colors.blue,
                        fontFamily: "Regular",
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            

            SizedBox(
              height: height25,
            ),
            Text("It's ${lastPlayer.toString()} turn",
                style: TextStyle(
                    fontSize: FontSize20,
                    color: lastPlayer == "X" 
                    ? Colors.blue 
                    : Colors.orange,
                    fontFamily: "Regular",
                    letterSpacing: 0,)),

            Container( // ขนาดตาราง
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.height / 2,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, int index) {

                  
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Center(
                          child: Text(
                            Display[index],
                            style: TextStyle(
                                color: Display[index] == "X"
                                    ? Colors.blue
                                    : Colors.orange,
                                fontSize: FontSize40 , fontFamily: "Regular",
                                letterSpacing: 0,),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            IconButton(
              onPressed: () {
                _ClearBoard();
              },
              icon: const Icon(Icons.refresh),
              color: Color.fromARGB(255, 226, 30, 144),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int elememt) {
    setState(() {
      if (firstPlayer && Display[elememt] == '') {
        Display[elememt] = 'X';
        lastPlayer = '0';
      } else if (!firstPlayer && Display[elememt] == '') {
        Display[elememt] = '0';
        lastPlayer = 'X';
      }
      firstPlayer = !firstPlayer;
      _CheckWinner();

      // Display[elememt] = elememt.toString();
    });
  }

  void _CheckWinner() {
    // 1st row check
    if (Display[0] == Display[1] &&
        Display[0] == Display[2] &&
        Display[0] != '') {
      ShowWinDialog(Display[0]);
    }
    // 2nd row check
    if (Display[3] == Display[4] &&
        Display[3] == Display[5] &&
        Display[3] != '') {
      ShowWinDialog(Display[3]);
    }
    // 3rd row check
    if (Display[6] == Display[7] &&
        Display[6] == Display[8] &&
        Display[6] != '') {
      ShowWinDialog(Display[6]);
    }
    // 1st column check
    if (Display[0] == Display[3] &&
        Display[0] == Display[6] &&
        Display[0] != '') {
      ShowWinDialog(Display[0]);
    }
    // 2nd column check
    if (Display[1] == Display[4] &&
        Display[1] == Display[7] &&
        Display[1] != '') {
      ShowWinDialog(Display[1]);
    }
    // 3rd column check
    if (Display[2] == Display[5] &&
        Display[2] == Display[8] &&
        Display[2] != '') {
      ShowWinDialog(Display[2]);
    }
    // check 1st Diagonal
    if (Display[0] == Display[4] &&
        Display[0] == Display[8] &&
        Display[0] != '') {
      ShowWinDialog(Display[0]);
    }
    // check 2nd Diagonal
    if (Display[2] == Display[4] &&
        Display[2] == Display[6] &&
        Display[2] != '') {
      ShowWinDialog(Display[2]);
    }
  }

  void ShowWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('winner is : $winner'),
            actions: [
              FloatingActionButton(
                child: Text('Play Again'),
                onPressed: () {
                  _ClearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
    if (winner == '0') {
      Player0 += 1;
    } else if (winner == 'X') {
      PlayerX += 1;
    }
  }

  void _ClearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        Display[i] = '';
      }
    });
  }

  void _refreshButton() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        Display[i] = '';
      }
    });
  }
}