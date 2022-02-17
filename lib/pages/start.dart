import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticgame/components/btn.dart';
import 'package:ticgame/components/logo.dart';
import 'package:ticgame/pages/pick.dart';
import 'package:ticgame/pages/settings.dart';
import 'package:ticgame/theme/theme.dart';

import 'game.dart';

class StartPage extends StatelessWidget {
  // final boardService = locator<BoardService>();
  // final soundService = locator<SoundService>();
  // final alertService = locator<AlertService>();

  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    //   onWillPop: () {
    //     Future.value(false);
    //   },
    //   child:
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.65],
              colors: [
                Colors.blue,
                Colors.yellow,
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[                    SizedBox(height: 60),

              Btn(
                onTap: () {
                  // soundService.playSound('click');
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => SettingsPage(),
                    ),
                  );
                },
                color: Colors.white,
                height: 50,
                width: 50,
                borderRadius: 25,
                child: Icon(Icons.settings),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Tic Tac",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 65,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'DancingScript'),
                    ),
Image.asset("assets/tic.png",height: 200,width: 200,)                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Btn(
                      onTap: () {
                        // boardService.gameMode$.add(GameMode.Solo);
                        // soundService.playSound('click');

                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => PickPage(
                              hi: 1,
                            ),
                          ),
                        );
                      },
                      height: 40,
                      width: 250,
                      borderRadius: 250,
                      color: Colors.white,
                      child: Text(
                        "single player".toUpperCase(),
                        style: TextStyle(
                            color: Colors.black.withOpacity(.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 30),
                    Btn(
                      onTap: () {
                        // boardService.gameMode$.add(GameMode.Multi);
                        // soundService.playSound('click');

                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => PickPage(
                              hi: 2,
                            ),
                          ),
                        );
                      },
                      color: Colors.white,
                      height: 40,
                      width: 250,
                      borderRadius: 250,
                      child: Text(
                        "with a friend".toUpperCase(),
                        style: TextStyle(
                            color: Colors.black.withOpacity(.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
