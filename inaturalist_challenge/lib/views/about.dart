// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:inaturalist_challenge/services/calls.dart';

// import 'package:inaturalist_challenge/widgets/tab_nav.dart';

// class AboutView extends StatelessWidget {
//   const AboutView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const Text(
//               "This application is built using Flutter and Dart",
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const Text(
//               'It fetches data for projects in Bermuda as well as endemic and introduced species observed in July of 2022.',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             TextButton(
//               onPressed: () => Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const TabNav(),
//                 ),
//               ),
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
//               ),
//               child: const Text('Go To Project',
//                   style: TextStyle(color: Colors.black)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
