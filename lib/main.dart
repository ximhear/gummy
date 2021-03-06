import 'package:flutter/material.dart';
import 'package:gummy/GMenuItem.dart';
import 'package:gummy/WordPkgRow.dart';
import 'package:gummy/WordPkgRowData.dart';
import 'package:gummy/WordPkgSection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final List<String> titles = <String>['해커스 토익', '수능 2020', 'IBT', "텝스", "중학영어", "고등영단어"];
    final List<String> sources = <String>['en-US', 'ko-KR', 'de-DE', "fr-FR", "ja-JP", "zh-CN"];
    final List<String> targets = <String>['ko-KR', 'en-US', 'ko-KR', "ja-JP", "zh-CN", "en-US"];
    final List<int> counts = <int>[80, 90, 100, 100, 40, 89];

    List<WordPkgRowData> rows = <WordPkgRowData>[];
    rows = List.generate(titles.length, (index){
      bool editable = true;
      if (index < 3) {
        editable = false;
      }
        return WordPkgRowData(
          type: WordPkgRowDataType.content,
          title: titles[index],
          count: counts[index],
          source: sources[index],
          target: targets[index],
          editable: editable,
        );
    });
    rows.insert(3, WordPkgRowData(
        type: WordPkgRowDataType.title,
        title: "mine"
    ));
    rows.insert(0, WordPkgRowData(
        type: WordPkgRowDataType.title,
        title: "gbulary"
    ));
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: rows.length,
        itemBuilder: (BuildContext context, int index) {
          if (rows[index].type == WordPkgRowDataType.title) {
            return WordPkgSection(title: rows[index].title);
          }
          return WordPkgRow(title: rows[index].title, count: rows[index].count, source: rows[index].source, target: rows[index].target, onMenuPressed: (menuIndex) {
            debugPrint("menu clicked : $index - $menuIndex");
          },
          menus: rows[index].editable == true ? [GMenuItem(title: "수정", value: 0), GMenuItem(title: "해제", value: 1)] : [GMenuItem(title: "해제", value: 1)]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.transparent,
        ),
      )),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
