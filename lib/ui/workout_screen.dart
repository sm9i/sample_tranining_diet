import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample_tranining_diet/model/upper_body_workout.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xff200087),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white, size: 40),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text(
                    "${DateFormat("EEEE").format(today)},${DateFormat("d MMM").format(today)}",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "Upper Body",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Colors.white,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '60 mins',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.shutter_speed,
                            color: Colors.white,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Easy',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                for (int i = 0; i < upperBody.length; i++)
                  Column(
                    children: <Widget>[
                      for (int j = 0; j < upperBody[i].length; j++)
                        ListTile(
                          title: Text(
                            upperBody[i][j].name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            upperBody[i][j].instruction,
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          leading: Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff5b4d9d),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              padding: EdgeInsets.all(6),
                              child: Image.asset(
                                upperBody[i][j].imagePath,
                                width: 40,
                                height: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      SizedBox(height: 30),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
