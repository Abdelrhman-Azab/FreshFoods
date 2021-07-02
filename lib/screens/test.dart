import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.9,
          child: PageView(
            children: [
              Center(
                child: Text("first page"),
              ),
              Center(
                child: Text("second page"),
              ),
              Center(
                child: Text("third page"),
              ),
            ],
          ),
        ),
        Text("heeloooo")
      ],
    ));
  }
}
