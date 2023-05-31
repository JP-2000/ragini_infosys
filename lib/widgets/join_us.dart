import 'package:flutter/material.dart';

class JoinUs extends StatelessWidget {
  const JoinUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            divider(),
            const Text("Or join with"),
            divider(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(5.0),
              height: 30.0,
              width: 30.0,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.asset("assets/google.png"),
              ),
            ),
            SizedBox(
              height: 30.0,
              width: 30.0,
              child: CircleAvatar(
                child: Image.asset("assets/facebook.png"),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget divider() {
    return Container(
      margin: const EdgeInsets.all(5.0),
      color: Colors.grey,
      width: 45.0,
      height: 1.0,
    );
  }
}
