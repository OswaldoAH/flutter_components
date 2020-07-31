import 'package:flutter/material.dart';

import 'package:examples/src/home/ui/home_screen.dart';
import 'package:examples/src/setting/ui/setting_screen.dart';


Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String,WidgetBuilder>{
      '/':(BuildContext context )=>HomeScreen(),
      'settings':(BuildContext context )=>SettingScreen()
  };
}
