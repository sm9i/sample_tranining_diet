import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sample_tranining_diet/model/meal.dart';
import 'package:sample_tranining_diet/ui/meal_detail_screen.dart';
import 'package:sample_tranining_diet/ui/workout_screen.dart';

//圆的方便api
import 'package:vector_math/vector_math_64.dart' as m;

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final today = DateTime.now();
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(
          iconSize: 30,
          selectedIconTheme: IconThemeData(
            color: const Color(0xFF200087),
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.black12,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.home),
              ),
              title: Text(
                'Home',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.search),
              ),
              title: Text(
                'Search',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.person),
              ),
              title: Text(
                'Person',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: height * 0.35,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40),
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 32,
                  right: 16,
                  bottom: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "${DateFormat("EEEE").format(today)},${DateFormat("d MMM").format(today)}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      subtitle: Text(
                        'Hello, Davia',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Container(
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Icon(
                          Icons.school,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        _RadialProgress(
                          width: height * 0.18,
                          height: height * 0.18,
                          progress: 0.7,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            _DietProgress(
                              ingredient: 'Protein',
                              progress: 0.72,
                              progressColors: Colors.green,
                              leftAmount: 72,
                            ),
                            _DietProgress(
                              ingredient: 'Apple',
                              progress: 0.2,
                              progressColors: Colors.redAccent,
                              leftAmount: 23,
                            ),
                            _DietProgress(
                              ingredient: 'Orange',
                              progress: 0.5,
                              progressColors: Colors.green,
                              leftAmount: 52,
                            ),
                            _DietProgress(
                              ingredient: 'Wdnmd',
                              progress: 0.44,
                              progressColors: Colors.deepPurple,
                              leftAmount: 44,
                            ),
                          ],
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.38,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.52,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8,
                      left: 32,
                      right: 16,
                    ),
                    child: Text(
                      'MEALS FOR TODAY',
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(width: 32),
                          for (int i = 0; i < meals.length; i++)
                            _MealCard(meal: meals[i])
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: OpenContainer(
                      openBuilder: (context, action) {
                        return WorkoutScreen();
                      },
                      closedColor: Color(0xffE9e9e9),
                      closedBuilder: (context, callback) {
                        return Container(
                          margin: const EdgeInsets.only(
                              left: 32, right: 32, bottom: 10),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFF20008B),
                                const Color(0xFF200087),
                              ],
                            ),
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 16, left: 16),
                                child: Text(
                                  'YOUR NEXT WORKOUT',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 4.0, left: 16),
                                child: Text(
                                  'Upper Body',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(width: 20),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xff5B4D9D),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/chest.png',
                                        width: 40,
                                        height: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xff5B4D9D),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/back.png',
                                        width: 40,
                                        height: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xff5B4D9D),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/biceps.png',
                                        width: 40,
                                        height: 40,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _DietProgress extends StatelessWidget {
  final String ingredient;
  final double leftAmount;
  final double progress;
  final Color progressColors;

  const _DietProgress(
      {Key key,
      this.ingredient,
      this.leftAmount,
      this.progress,
      this.progressColors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(ingredient),
        Row(
          children: <Widget>[
            Expanded(child: LayoutBuilder(
              builder: (_, size) {
                return Stack(
                  children: <Widget>[
                    Container(
                      height: 10,
                      width: size.maxWidth,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Container(
                      height: 10,
                      width: size.maxWidth * progress,
                      decoration: BoxDecoration(
                        color: progressColors,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                );
              },
            )),
            SizedBox(width: 10),
            Text('$leftAmount g left '),
          ],
        )
      ],
    );
  }
}

class _RadialProgress extends StatelessWidget {
  final double height, width, progress;

  const _RadialProgress({Key key, this.height, this.width, this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: '1731',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF200087))),
              TextSpan(text: '\n'),
              TextSpan(
                text: 'kcal left',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF200087)),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10.0
      ..color = Color(0xFF200087)
      //圆角笔
      ..strokeCap = StrokeCap.round
      //样式不为填充
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    //画圆
//    canvas.drawCircle(center, size.width / 2, paint);
    //
    //
    // useCenter 是否闭合
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: size.width / 2),
      m.radians(-90),
      m.radians(-progress * 360),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _MealCard extends StatelessWidget {
  final Meal meal;

  const _MealCard({Key key, @required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 20,
        bottom: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (_) => MealDetailScreen(
                meal: meal,
              ),
            ),
          );
        },
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    meal.imagePath,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        meal.mealTime,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Text(
                        meal.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "${meal.kiloCaloriesBurnt} kcal",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Colors.black12,
                            size: 15,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "${meal.timeTaken} min",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
