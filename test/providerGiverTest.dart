// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:x_bloc/src/Helpers/Provider/Providerlib.dart';
// import 'package:x_bloc/src/Helpers/Provider/moduel.dart';
//
// Controller controller = Controller();
//
// HDMProvide p1 = HDMProvide<int>(1);
// HDMProvide p2 = HDMProvide<int>(2);
// HDMProvide p3 = HDMProvide<int>(3);
// HDMProvide p4 = HDMProvide<int>(4);
// HDMProvide p5 = HDMProvide<int>(5);
// Widget a1 = Text("1stChild", key: Key("1stChild"));
// Widget a2 = Text("2stChild", key: Key("2stChild"));
// Widget pointer = a1;
//
// class HDMProviderTest extends StatefulWidget {
//   HDMProviderTest();
//   @override
//   _HDMProviderTestState createState() => _HDMProviderTestState();
// }
//
// class _HDMProviderTestState extends State<HDMProviderTest> {
//   @override
//   Widget build(BuildContext context) {
//     print("rebuild");
//     return Scaffold(
//       body: HDMProvider(pointer, [p1, p2, p3, p4, p5]),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {});
//         },
//         key: Key("button"),
//       ),
//     );
//   }
// }
//
// class Controller {
//   Function fn;
// }
