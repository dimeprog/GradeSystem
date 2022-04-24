import 'package:flutter/material.dart';
import 'result_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {ResultScreen.routeName: (context) => ResultScreen()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();
  final numberController = TextEditingController();

  double score = 0.0;
  void result() {
    final course = textController.text;
    final score = double.tryParse(numberController.text);
    if (score! >= 80 && score <= 100) {
      Navigator.of(context).pushNamed(ResultScreen.routeName,
          arguments: {'gradeLabel': 'Your Grade is A', 'course': course});
      print('Your Grade is A');
    } else if (score >= 60 && score < 80) {
      print('Your grade is B');
      Navigator.of(context).pushNamed(ResultScreen.routeName,
          arguments: {'gradeLabel': 'Your Grade is B', 'course': course});
    } else if (score >= 50 && score < 60) {
      print('Your grade is C');
      Navigator.of(context).pushNamed(ResultScreen.routeName,
          arguments: {'gradeLabel': 'Your Grade is C', 'course': course});
    } else if (score >= 40 && score < 50) {
      print('Your grade is D');
      Navigator.of(context).pushNamed(ResultScreen.routeName,
          arguments: {'gradeLabel': 'Your Grade is D', 'course': course});
    } else if (score < 40) {
      print('Your grade is F');
      Navigator.of(context).pushNamed(ResultScreen.routeName,
          arguments: {'gradeLabel': 'Your Grade is F', 'course': course});
    } else {
      print('invalid score');
      Navigator.of(context).pushNamed(ResultScreen.routeName,
          arguments: {'gradeLabel': 'invalid score', 'course': course});
    }
  }

  @override
  Widget build(BuildContext context) {
    // double score=0.0;
    final score = double.tryParse(numberController.text);
    final String course = textController.text;
    return Scaffold(
      appBar: AppBar(
        title: Text('testapp'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              //
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    label: Text('Your Course'),
                    fillColor: Colors.lightBlue,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: numberController,
                  decoration: const InputDecoration(
                      label: Text('Your Grade'), fillColor: Colors.lightBlue),
                ),
                TextButton(
                  onPressed: result,
                  child: const Text(
                    'Result',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
