import 'package:flutter/material.dart';

import 'package:examples/src/home/data/model/name_list.dart';

class HomeScreen extends StatelessWidget {
  final data = model;

  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.of(context).pushNamed('settings');
              })
        ],
        title: Text('Examples'),
      ),
      body: Container(
        child: ListView.separated(
          itemCount: data.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.black26,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('${data[index].name}'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
