import 'package:flutter/material.dart';
import 'challenges.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MaterialApp(home:MyApp()));

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void alertYUP(){
    challengeIndex=0;
    showDialog(
    context: context,
    builder:(BuildContext context)=>AlertDialog(
      title: Text('COMPLETED!!'),
      content: Text('You have completed all the challenges'),
      actions: <Widget>[
        FlatButton(
          child: Text('Cool'),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ],
    ),
    barrierDismissible: true,
    );
  }

  int challengeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.red,
                      ),
                      //Contains the daily challenge
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${challenges[challengeIndex]}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'KINDNESS CHALLENGE DAY #${challengeIndex+1}',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.blueAccent,
                          size: 60.0,
                        ),
                        onPressed: (){
                          setState(() {
                            challengeIndex==0? challengeIndex=0:challengeIndex--;
                          });
                        },
                      ),
                      FlatButton(
                        child: Icon(
                          Icons.check_circle_outline,
                          color: Colors.greenAccent,
                          size: 60.0,
                      ),
                        onPressed: (){
                          setState(() {
                            challengeIndex==challenges.length -1? alertYUP():challengeIndex++;
                          });
                          }),

                      FlatButton(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.blueAccent,
                          size: 60.0,
                        ),
                        onPressed: (){
                          setState(() {
                            challengeIndex==challenges.length -1? challengeIndex=challenges.length -1:challengeIndex++;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ),
        ),
      );
    }
}