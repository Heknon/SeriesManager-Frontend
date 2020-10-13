import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:seriesmanager_frontend/components/appbar.dart';

class MainPageContainer extends StatelessWidget {
  const MainPageContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: CustomScrollView(
         slivers: [
           CustomAppBar()
         ],
         
       ),
    );
  }
}