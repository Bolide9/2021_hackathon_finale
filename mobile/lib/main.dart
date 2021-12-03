import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rosseti_hack/colors.dart';
import 'package:flutter_rosseti_hack/font.dart';
import 'package:flutter_rosseti_hack/questions/screens/questionScreen.dart';
import 'package:flutter_rosseti_hack/widgets/gradientButton.dart';
import 'package:flutter_rosseti_hack/widgets/switch_containers.dart';
import 'widgets/appBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      // debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        textTheme: TextTheme(
          headline1: interFont(),
          headline6: interFont(),
          bodyText2: interFont(),
        ),
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  Color selectedColor = Color.fromRGBO(88, 189, 125, 1);
  Color unSelectedColor = Color.fromRGBO(53, 57, 69, 1);
  Color unBorderSelectedColor = Color.fromRGBO(53, 57, 69, 1);

  void _changeIndex(int val) {
    if (index == 2 || index < 2) {
      setState(() {
        index = val;
      });
      return;
    }
    print('None');
  }

  Future<void> _pushToQuestionsScreen() => Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionScreen()));

  List<Widget> _getSwitchContainers() => [
        GestureDetector(
          onTap: () => _changeIndex(0),
          child: SwitchContainers(
            text: 'Теория',
            textColor: index == 0 ? selectedColor : unSelectedColor,
            borderColor: index == 0 ? selectedColor : unBorderSelectedColor,
          ),
        ),
        SizedBox(width: 12),
        GestureDetector(
          onTap: () => _changeIndex(1),
          child: SwitchContainers(
            text: 'Практика',
            textColor: index == 1 ? selectedColor : unSelectedColor,
            borderColor: index == 1 ? selectedColor : unBorderSelectedColor,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: MainAppBar(
          showDialogButton: true,
          withText: true,
          withLogo: true,
          appBarText: 'Colibri',
          paddingText: 8.0,
          withQuestionCount: false,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ислам Мората',
                  style: interFont(fontSize: 24),
                ),
                SizedBox(height: 4),
                Text(
                  'xvmorata@gmail.com',
                  style: interFont(
                    fontSize: 14,
                    color: Color.fromRGBO(119, 126, 144, 1),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: _getSwitchContainers(),
                ),
              ],
            ),
          ),
          Spacer(),
          GradientButton(
            text: 'Начать обучение',
            onPressed: () => _pushToQuestionsScreen(),
          ),
        ],
      ),
    );
  }
}
