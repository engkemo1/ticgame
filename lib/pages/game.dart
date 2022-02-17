import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:ticgame/components/o.dart';
import 'package:ticgame/components/x.dart';
import 'package:ticgame/pages/start.dart';
import 'package:ticgame/services/gane%20logic.dart';
import 'package:ticgame/theme/theme.dart';

class GamePage extends StatefulWidget {
  final int? hi;
  final String? start;

  GamePage({Key? key, this.hi, this.start}) : super(key: key);

  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  // final boardService = locator<AlertService>();
  String activePlayer = "X";
  bool gameOver = false;
  String result = "";
  Game game = Game();
  int winnerX = 0;
  int winner0 = 0;
  int turns = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.white,
                    height: 40,
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.home),
                          onPressed: () {
                            Player.playerO.clear();
                            Player.playerX.clear();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => StartPage()));
                          },
                          color: Colors.black87,
                          iconSize: 30,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Material(
                          elevation: 5,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          child: Center(
                              child: Text(
                            "$winnerX",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          )),
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      X(35, 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Player",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 400,
                    child: GridView.count(
                      padding: const EdgeInsets.all(16),
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      children: List.generate(
                          9,
                          (index) => InkWell(
                                onTap: gameOver
                                    ? null
                                    : () {
                                        _onTap(index);
                                      },
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Center(
                                      child: Text(
                                        Player.playerX.contains(index)
                                            ? "X"
                                            : Player.playerO.contains(index)
                                                ? "O"
                                                : "",
                                        style: const TextStyle(
                                            color: Colors.yellow, fontSize: 50),
                                      ),
                                    )),
                              )),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: Colors.white,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        O(35, MyTheme.green),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(
                            "Player",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Material(
                            elevation: 5,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            child: Center(
                                child: Text(
                              "$winner0",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.repeat),
                          onPressed: () {
                            setState(() {
                              activePlayer = "x";
                              gameOver = false;
                              turns = 0;
                              result = "";
                              Player.playerO = [];
                              Player.playerX = [];
                            });
                          },
                          color: Colors.black87,
                          iconSize: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              )),

              //         // StreamBuilder<MapEntry<int, int>>(
              //         //     stream: boardService.score$,
              //         //     builder: (context, AsyncSnapshot<MapEntry<int, int>> snapshot) {
              //         //       if (!snapshot.hasData) {
              //         //         return Container();
              //         //       }
              //         //       final int xScore = snapshot.data.key;
              //         //       final int oScore = snapshot.data.value;
              //         //
              //         //
              //         //       return
              //         Container(
              //   color: Colors.red,
              //   width: MediaQuery.of(context).size.width,
              //   child: Column(
              //     mainAxisSize: MainAxisSize.max,
              //     children: <Widget>[
              //       Expanded(
              //         child: Column(
              //           mainAxisSize: MainAxisSize.max,
              //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //           children: <Widget>[
              //             Container(
              //               padding: EdgeInsets.symmetric(horizontal: 20),
              //               color: Colors.white,
              //               child: Row(
              //                 mainAxisSize: MainAxisSize.max,
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 children: <Widget>[
              //                   SizedBox(
              //                     height: 40,
              //                     width: 40,
              //                     child: Material(
              //                       elevation: 5,
              //                       color: Colors.white,
              //                       borderRadius: BorderRadius.circular(20),
              //                       child: Center(
              //                           child: Text(
              //                         "7",
              //                         style: TextStyle(
              //                             color: Colors.black, fontSize: 18),
              //                       )),
              //                     ),
              //                   ),
              //                   Expanded(
              //                     child: Container(),
              //                   ),
              //                   X(35, 10),
              //                   Padding(
              //                     padding:
              //                         const EdgeInsets.symmetric(horizontal: 10),
              //                     child: Text(
              //                       "Player",
              //                       style: TextStyle(fontSize: 20),
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             ),
              //             Container(
              //
              //               child:Column(
              //                 mainAxisSize: MainAxisSize.max,
              //               mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   GridView.count(
              //
              //                     padding: const EdgeInsets.all(16),
              //                     crossAxisCount: 3,
              //                     childAspectRatio: 1.0,
              //                     crossAxisSpacing: 8.0,
              //                     mainAxisSpacing: 8.0,
              //                     children: List.generate(9, (index) => InkWell(
              //                       onTap: (){},
              //                       child: Container(
              //                         decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(16)),
              //                         child: Text(Player.playerX.contains(index)?"X":Player.playerO.contains(index)?"O":""
              //                           ,style: const TextStyle(color: Colors.yellow,fontSize:50 ),),
              //
              //                       ),
              //                     )),
              //
              //                   ),
              //                 ],
              //               )
              //             ),
              //             // Container(
              //             //     child: Column(
              //             //   mainAxisSize: MainAxisSize.max,
              //             //   mainAxisAlignment: MainAxisAlignment.center,
              //             //   children: <Widget>[Board()],
              //             // )),
              //
              //             Container(
              //               padding: EdgeInsets.symmetric(horizontal: 20),
              //               color: Colors.white,
              //               child: Row(
              //                 mainAxisSize: MainAxisSize.max,
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 children: <Widget>[
              //                   O(35, MyTheme.green),
              //                   Padding(
              //                     padding: EdgeInsets.symmetric(
              //                       horizontal: 10,
              //                     ),
              //                     child: Text(
              //                       "Player",
              //                       style: TextStyle(fontSize: 20),
              //                     ),
              //                   ),
              //                   Expanded(
              //                     child: Container(),
              //                   ),
              //                   SizedBox(
              //                     height: 40,
              //                     width: 40,
              //                     child: Material(
              //                       elevation: 5,
              //                       color: Colors.white,
              //                       borderRadius: BorderRadius.circular(20),
              //                       child: Center(
              //                           child: Text(
              //                         "0",
              //                         style: TextStyle(
              //                             color: Colors.black, fontSize: 18),
              //                       )),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Container(
              //         color: Colors.white,
              //         height: 60,
              //         padding: EdgeInsets.symmetric(horizontal: 20),
              //         child: Row(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: <Widget>[
              //             Expanded(
              //               child: Container(),
              //             ),
              //             IconButton(
              //               icon: Icon(Icons.home),
              //               // onPressed: () {
              //               //   boardService.newGame();
              //               //   Navigator.of(context)
              //               //       .popUntil((route) => route.isFirst);
              //               // },
              //               color: Colors.black87,
              //               iconSize: 30, onPressed: () {},
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // )),
            )),
      ),
    );
  }

  _onTap(int index) async {
    if (Player.playerX.isEmpty ||
        !Player.playerX.contains(index) ||
        Player.playerO.isEmpty ||
        !Player.playerO.contains(index)) {
      game.playGame(index, activePlayer);
      UpdateState();

      if (widget.hi == 1 && gameOver == false) {
        await game.autoPlay(activePlayer);
        UpdateState();
      }
    }
  }

  void UpdateState() {
    setState(() {
      activePlayer = (activePlayer == "X") ? "O" : "X";
      turns++;
    });
    String win = game.checkWinner();
    if (win == "draw" && turns == 9) {

      result = "It\'s Draw!";
      Alert(
        context: context,
        title:result,
        buttons: [
          DialogButton(
            child: Text(
              "COOL",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    } else if (win == "X") {

      gameOver = true;
      result = "Player X is the Winner";
      Alert(
        context: context,
        title: result,
        buttons: [
          DialogButton(
            child: Text(
              "COOL",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      setState(() {
        winnerX++;
      });
    } else if (win == "O") {
      gameOver = true;

      result = "Player O is the Winner";
      Alert(
        context: context,
        title: result,
        buttons: [
          DialogButton(
            child: Text(
              "COOL",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      setState(() {
        winner0++;
      });
    }
  }
}
