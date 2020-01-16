import 'package:flutter/material.dart';

import 'paths.dart';
import '../pages/log_in.dart';
import '../pages/register.dart';
import '../pages/reset.dart';


import '../pages/components/agreement.dart';

//route for examples
import 'package:lxk/pages/examples/lists.dart';

Map<String, WidgetBuilder> routers = {
    log_in: (BuildContext context) {
      return new LoginPage();
    },
    register: (BuildContext context) {
      return new Register();
    },
    reset: (BuildContext context) {
      return new Reset();
    },
    root: (BuildContext context) {
      return new LoginPage();
    },


    agreement: (BuildContext context) {
      return new Agreement(title: "用户协议",);
    },
  //example list
  exmaple_list: (BuildContext context) {
    return new ExamplesListPage(title: "Flutter 例子",);
  },

};
