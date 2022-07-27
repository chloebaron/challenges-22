import 'package:flutter/material.dart';

import '../views/reptile_view.dart';
import '../views/spider_view.dart';

class NavButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ReptileView())),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            child:
                const Text('Reptiles', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: (() => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SpiderView()),
                )
                
                ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            child: const Text('Spiders', style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
