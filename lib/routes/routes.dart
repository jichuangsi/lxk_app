import 'package:flutter/material.dart';

import 'paths.dart';
import '../pages/log_in.dart';

//route for examples
import 'package:lxk/pages/examples/lists.dart';

Map<String, WidgetBuilder> routers = {
    log_in: (BuildContext context) {
      return new LoginPage();
    },
    root: (BuildContext context) {
      return new LoginPage();
    },

  //example list
  exmaple_list: (BuildContext context) {
    return new ExamplesListPage(title: "Flutter 例子",);
  },

};
