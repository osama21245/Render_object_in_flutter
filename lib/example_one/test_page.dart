import 'package:flutter/material.dart';
import 'package:render_object_examples/example_one/gap.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(children: <Widget>[
      Gap(space: 200),
      Text("Hello World"),
      SizedBox(
        height: 100,
      ),
      Text("Hello World"),
      Row(
        children: [
          Gap(space: 100),
          Text("Hello World"),
          SizedBox(
            width: 100,
          ),
          Text("Hello World")
        ],
      )
    ]));
  }
}
