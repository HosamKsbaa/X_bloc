// //region  imports
//
// //endregion
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class ME {
//   //region  Keys
//   static List _keyList = [mainK, nameK, ageK];
//   HDMMain<ME> data;
//   void _start() => data = HDMMain<ME>(this, _widgetME, _keyList);
//   static HDMKey<ME> mainK;
//   static HDMKey<ME> nameK;
//   static HDMKey<ME> ageK;
//   //endregion
//
//   ME() {
//     _start();
//   }
//
//   String name = "hosam";
//   int age = 0;
//   void growold() {
//     age++;
//     data.update(mainK);
//   }
// }
//
// // Widget _counter(BuildContext context, ME app) {
// //   return Column(
// //     children: [
// //       Text("Normal"),
// //       HDMBuilder(
// //         keyBuilder: ME.mainK.build((box) => Column(
// //               children: [
// //                 Text(box.app.age.toString() + "2"),
// //                 box.key(1).cash(() => Text(box.app.age.toString() + " Cashed")),
// //               ],
// //             )),
// //       )
// //     ],
// //   );
// // }
//
// Widget _widgetME(HDMBox<ME> box) {
//   return Scaffold(
//       body: HDM(
//           child: ME.mainK.keyBuild((box) => Scaffold(
//                 appBar: box.key(1).cash(() => Text(
//                       box.hdmMainObj.name,
//                     )),
//                 body: Text(box.hdmMainObj.age.toString()),
//               ))));
// }
