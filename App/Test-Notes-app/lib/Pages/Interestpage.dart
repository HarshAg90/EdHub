import 'package:flutter/material.dart';
import 'package:notes_app/utils/routes.dart';
import '../utils/routes.dart';

void main() {
  runApp(interest());
}

class interest extends StatefulWidget {
  const interest({super.key});

  @override
  State<interest> createState() => _interestState();
}

class _interestState extends State<interest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("Interest page"),
            DropdownButton<String>(
              items: <String>[
                'Mobile Development',
                'Web Development',
                'AI',
                'ML'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            )
          ],
        ),
      ),
    );
  }
}
