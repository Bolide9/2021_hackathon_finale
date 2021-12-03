import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rosseti_hack/chat/screens/chatScreen.dart';
import 'package:flutter_rosseti_hack/colors.dart';
import 'package:flutter_rosseti_hack/font.dart';
import 'package:flutter_rosseti_hack/questions/screens/questionScreen.dart';
import 'package:flutter_rosseti_hack/questions/service/QuestionService.dart';
import 'package:flutter_rosseti_hack/widgets/gradientButton.dart';
import 'package:flutter_rosseti_hack/widgets/main_cards.dart';
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
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        textTheme: TextTheme(
          headline1: interFont(),
          headline6: interFont(),
          bodyText2: interFont(),
        ),
      ),
      home: const SplashVIew(),
    );
  }
}

class SplashVIew extends StatelessWidget {
  const SplashVIew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

    Future<void> _goNext() async {
      await Future.delayed(
        Duration(seconds: 3),
      );

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
          (route) => false);
    }

    _goNext();

    return Scaffold(
      body: Center(
        child: Image.asset(
          'images/splash_image.png',
        ),
      ),
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
  List mainCards = [
    'Количество вопросов',
    'Количество правильных ответов',
  ];

  List mainItems = [
    '${questions.length}',
    '${QuestionService.getRating}',
  ];

  List subCards = [
    'Общее время полета',
    'Общая дистанция полета',
    'Время между чек-поинтами',
    'Точность полета',
    'Количество найденных аварий',
    'Количество столкновений',
  ];

  List subItems = [
    '50 минут',
    '5 км',
    '5 минут',
    '89%',
    '8',
    '1',
  ];

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

  Widget getTheory() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text('Последний тест: сегодня в 12:53'),
                SizedBox(height: 20),
                Column(
                  children: List.generate(
                    2,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: MainCards(
                        title: mainCards[index],
                        subtitle: mainItems[index],
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Text('Последний полет: сегодня в 14:11'),
                SizedBox(height: 20),
                Column(
                  children: List.generate(
                    6,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: MainCards(
                        title: subCards[index],
                        subtitle: subItems[index],
                        onTap: () {},
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

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
          onChatPressed: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ChatScreen(),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
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
            if (index == 0) getTheory(),
            SizedBox(height: 24),
            GradientButton(
              text: 'Начать обучение',
              onPressed: () {
                _pushToQuestionsScreen();
              },
            ),
          ],
        ),
      ),
    );
  }
}
