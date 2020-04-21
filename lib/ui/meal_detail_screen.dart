import 'package:flutter/material.dart';
import 'package:sample_tranining_diet/model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailScreen({Key key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9e9e9),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: const Color(0xff200087),
            expandedHeight: 300,
            snap: true,
            floating: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40))),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40)),
                child: Image.asset(
                  meal.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 20),
                ListTile(
                  title: Text(
                    "${meal.mealTime.toUpperCase()}",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.blueGrey),
                  ),
                  subtitle: Text(
                    meal.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(width: 20),
                          Text(
                            "${meal.kiloCaloriesBurnt} kcal",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 5),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.shutter_speed,
                            color: Colors.grey,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Easy',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "INGREDIENTS",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.blueGrey),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      for (int i = 0; i < meal.ingredients.length; i++)
                        Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            meal.ingredients[i],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "PERPARATION",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.blueGrey),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
                  child: Text(
                    meal.preparation,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
