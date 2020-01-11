import 'package:flutter/material.dart';

//import 'package:lxk/routes/routes.dart';
import 'package:lxk/routes/paths.dart';

import 'package:lxk/pages/examples/shared_preferences.dart';

class ExamplesListPage extends StatefulWidget {
  ExamplesListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ExamplesListPageState createState() => _ExamplesListPageState();
}

class _ExamplesListPageState extends State<ExamplesListPage> {
  @override
  Widget build(BuildContext context) {
    var routeLists = example_routers.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: InkWell(
          onTap: () {
            Navigator.popAndPushNamed(context, log_in);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: new Container(
        child: new ListView.builder(
          itemBuilder: (context, index) {
            return new InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => example_routers[routeLists[index]],
                  ),
                );
              },
              child: new Card(
                child: new Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: new Text(example_names[index]),
                ),
              ),
            );
          },
          itemCount: example_routers.length,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


//example routes
Map<String, Widget> example_routers = {
  shared_preferences: new SharedPreferencesDemo(),
};

const example_names = [
  "本地缓存 例子"
];