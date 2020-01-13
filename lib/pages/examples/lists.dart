import 'package:flutter/material.dart';

//import 'package:lxk/routes/routes.dart';
import 'package:lxk/routes/paths.dart';

import 'package:lxk/pages/examples/shared_preferences.dart';
import 'package:lxk/pages/examples/geo_locator.dart';
import 'package:lxk/pages/examples/network_connectivity.dart';
import 'package:lxk/pages/examples/url_launcher.dart';
import 'package:lxk/pages/examples/image_picker.dart';

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
  shared_preferences: new SharedPreferencesPage(),
  geo_locator: new GeolocatorPage(),
  network_connectivity: new NetworkConnectivityPage(title:'Network Connectivity'),
  url_launcher: new UrlLauncherPage(title:'URL Launcher'),
  image_picker: new ImagePickerPage(),
};

const example_names = [
  "本地缓存 例子",
  "移动端定位 例子",
  "检查移动端网络连接 例子",
  "打开URL/发短信/打电话  例子",
  "移动端图片(imge_picker) 例子"
];