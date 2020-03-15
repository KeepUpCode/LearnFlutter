import 'package:flutter/material.dart';
import 'package:flutterapp/widget/ButtonDemoPage.dart';
import 'widget/TextDemoPage.dart';
import 'widget/ImageDemoPage.dart';
import 'widget/SwitchAndCheckBoxDemoPage.dart';
import 'widget/TextFieldAndFormDemoPage.dart';
import 'widget/ProgressDemoPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: routers,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var routeLists = routers.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: new ListView.builder(
          itemBuilder: (context, index) {
            return new InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(routeLists[index]);
              },
              child: new Card(
                child: new Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: new Text(routerName[index]),
                ),
              ),
            );
          },
          itemCount: routers.length,
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


const routerName = [
  "Text Demo",
  "Button Demo",
  "Image Demo",
  "Switch and CheckBox Demo",
  "TextField and Form Demo",
  "Progress Demo"
];

Map<String, WidgetBuilder> routers = {
  "widget/text" : (context){
    return new TextDemoPage();
  },
  "widget/button" : (context){
    return new ButtonDemoPage();
  },
  "widget/image" : (context){
    return new ImageDemoPage();
  },
  "widget/switchandcheckbox" : (context){
    return new SwitchAndCheckBoxDemoPage();
  },
  "widget/textfieldandform" : (context){
    return new TextFieldAndFormDemoPage();
  },
  "widget/progress" : (context){
    return new ProgressDemoPage();
  }
};
