import 'package:flutter/material.dart';

class RecipesScreen extends StatefulWidget {
  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  bool elev = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AnimatedContainer(
            width: double.infinity,
            color: elev ? Colors.yellow : Colors.white,
            height: elev ? 100 : 300,
            duration: Duration(milliseconds: 300),
            child: Image.asset("images/broccoli.png"),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  elev = !elev;
                });
              },
              child: Text("PRESS"))
        ],
      ),
    );
  }
}
