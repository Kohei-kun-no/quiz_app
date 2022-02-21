import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SLEEP SCORE'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 24,),
            Container(
              child: Text("We can show you your \n SLEEP SCORE", style: TextStyle(fontSize: 32),),
            ),
            SizedBox(height: 40,),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizPage(),
                      ));
                },
                child: Text("START"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
