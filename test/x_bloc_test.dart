// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// import 'file:///C:/current%20projects/AAA_Storage/libs/stateMangment/x_bloc%20-%20Copy/lib/src/Helpers/Other/mixin.dart';
//
// import 'newApp.dart';
//
// void main() {
//   // group("", () {
//   //   test('Testing static key maping', () {
//   //     final x = ME.main2;
//   //     final x2 = ME.main;
//   //     final X3 = ME.main3;
//   //     final ME counter = ME();
//   //     final TestCounter2 counter2 = TestCounter2();
//   //
//   //     final x24 = HDMMix.keyMap;
//   //     final x34 = HDMMix.keyMap;
//   //   });
//   //   // testWidgets('Testing the HDMProvider', (WidgetTester tester) async {
//   //   //   //HDMProvider jDMProvider = HDMProvider(pointer, [p1, p2, p3, p4, p5]);
//   //   //   await tester.pumpWidget(MaterialApp(
//   //   //     home: Contextprovider(
//   //   //       HDMProviderTest(),
//   //   //     ),
//   //   //   ));
//   //   //   expect(find.byKey(Key("1stChild")), findsOneWidget, reason: "yes1stChild");
//   //   //
//   //   //   //controller.fn(() {});
//   //   //   await tester.tap(find.byKey(Key("button")));
//   //   //   pointer = a2;
//   //   //
//   //   //   await tester.pumpAndSettle();
//   //   //   //controller.fn(() {});
//   //   //   expect(find.byKey(Key("1stChild")), findsNothing, reason: "no1stChild");
//   //   //   expect(find.byKey(Key("2stChild")), findsOneWidget, reason: "yes2stChild");
//   //   //
//   //   //   //expect(jDMProvider.first.child., p1, reason: "first is right");
//   //   // });
//   // });
//   group("Block Testing", () {
//     String a1 = "Witout waiting";
//     String a2 = "With waiting";
//     String x1 = "Testing dirctly";
//     String x2 = "Testing using provider";
//     String z1 = " WithDirict insertion of qubit";
//     String z2 = " NO Dirict insertion of qubit";
//
//     testWidgets("Warm Up test", (WidgetTester tester) async {
//       //region
//       var x = CounterApp.witoutWait();
//
//       await tester.pumpWidget(MaterialApp(home: Contextprovider(x.state.play())));
//
//       //await tester.tap(find.byKey(Key("Tap1")));
//       await x.plus(); //
//       await tester.pumpAndSettle();
//       expect(x.counter, 1, reason: "the counter var it self is not right ");
//       expect(find.text("1"), findsOneWidget, reason: "noramal");
//       //endregion
//     });
//     testWidgets('$x1 $a1', (WidgetTester tester) async {
//       //region
//       var x = CounterApp.witoutWait();
//
//       await tester.pumpWidget(MaterialApp(home: Contextprovider(x.state.play())));
//
//       //await tester.tap(find.byKey(Key("Tap1")));
//       await x.plus(); //
//       await tester.pumpAndSettle();
//       expect(x.counter, 1, reason: "the counter var it self is not right ");
//       expect(find.text("1"), findsOneWidget, reason: "noramal");
//       //endregion
//     });
//     testWidgets('$x2 $a1', (WidgetTester tester) async {
//       //region
//       var x = CounterApp.witoutWait();
//
//       await tester.pumpWidget(MaterialApp(home: Contextprovider(x.state.play())));
//
//       await x.plus2();
//       await tester.pumpAndSettle();
//       await tester.pumpAndSettle();
//       expect(x.counter, 1, reason: "the counter var it self is not right ");
//       expect(find.text("101"), findsOneWidget, reason: "Provider");
//       //endregion
//     });
//
//     testWidgets('$x1 $a2', (WidgetTester tester) async {
//       //region
//       await tester.runAsync(() async {
//         var x = CounterApp.withWait();
//
//         await tester.pumpWidget(MaterialApp(home: Contextprovider(x.state.play())));
//         // await tester.pumpAndSettle();
//
//         expect(x.state.initial.runtimeType, StatsInitial, reason: "init widget is stored");
//         // expect(find.byKey(Key("Temp init Animation")), findsOneWidget, reason: "init widget is showed");
//         await Future.delayed(const Duration(seconds: 2), () => print("timer >>$x2 $a2 done"));
//
//         await x.plus();
//         await tester.pumpAndSettle();
//         expect(x.counter, 1, reason: "the counter var it self is not right ");
//         expect(find.text("1"), findsOneWidget, reason: "Provider");
//       });
//       //endregion
//       // expect(find.text("1"), findsOneWidget, reason: "noramal");
//     });
//     testWidgets('$x2 $a2', (WidgetTester tester) async {
//       //region
//       await tester.runAsync(() async {
//         var x = CounterApp.withWait();
//
//         await tester.pumpWidget(MaterialApp(home: Contextprovider(x.state.play())));
//         // await tester.pumpAndSettle();
//
//         expect(x.state.initial.runtimeType, StatsInitial, reason: "init widget is stored");
//         // expect(find.byKey(Key("Temp init Animation")), findsOneWidget, reason: "init widget is showed");
//         await Future.delayed(const Duration(seconds: 2), () => print("timer >>$x2 $a2 done"));
//
//         await x.plus2();
//         await tester.pumpAndSettle();
//         expect(x.counter, 1, reason: "the counter var it self is not right ");
//         expect(find.text("101"), findsOneWidget, reason: "Provider");
//         //endregion
//       });
//     });
//   });
// }
//
// //
// // class CounterAppEnum extends HDMEnum<CounterApp> {
// //   const CounterAppEnum(int val) : super(val);
// //   static const CounterAppEnum a2ndTestBox = CounterAppEnum(0);
// // }
// //
// // class CounterApp implements GetCubitInterface {
// //   HDM<CounterApp> data;
// //
// //   CounterApp.witoutWait() {
// //     data = HDM<CounterApp>(
// //       this,
// //       _CounterAppWidget,
// //     );
// //   }
// //   HDM getHDM() {
// //     return data;
// //   }
// //
// //   CounterApp.withWait() {
// //     data = HDM<CounterApp>(
// //       this,
// //       _CounterAppWidget,
// //       wait,
// //     );
// //   }
// //
// //   int counter = 0;
// //   void plus() {
// //     counter++;
// //     data.update(HDMEnum.MainPage);
// //
// //     expect(1, 1, reason: "hello");
// //   }
// //
// //   bool withProvider = false;
// //   void plus2() {
// //     withProvider = true;
// //     counter++;
// //     data.updateSpecificHDMBuilder([CounterAppEnum.a2ndTestBox]);
// //   }
// //
// //   Future<void> wait() async {
// //     print("start");
// //     await Future.delayed(const Duration(seconds: 2), () => print("timer >>The main Wait func done"));
// //     print("done");
// //     // data.update(["MainPage"]);
// //     // Timer(Duration(seconds: 7), () {
// //     //   print("Yeah, this line is printed after 3 seconds");
// //     //
// //     //   data.update(["MainPage"]);
// //     // });
// //   }
// // }
// //
// // Widget _CounterAppWidget(BuildContext context, CounterApp counterApp) {
// //   return Scaffold(
// //     body: Center(
// //       child: Column(
// //         children: [
// //           Text(counterApp.counter.toString()),
// //           counterApp.withProvider == true
// //               ? HDMProviderObj(
// //                   passedChild: HDMProviderBuilder<CounterApp>(
// //                     code: CounterAppEnum.a2ndTestBox,
// //                     child: (context, CounterAppobj) => Text((CounterAppobj.counter + 100).toString()),
// //                   ),
// //                 )
// //               : Text("counterApp.counter.toString()"),
// //         ],
// //       ),
// //       //     hdmBuilder<CounterApp>(
// //       //   code: "TextBox1",
// //       //   build: (context, counterApp) => Text(
// //       //     counterApp.counter.toString(),
// //       //     key: Key("string box 1"),
// //       //   ),
// //       // )
// //     ),
// //     floatingActionButton: FloatingActionButton(
// //       onPressed: counterApp.plus,
// //       key: Key("Tap1"),
// //     ),
// //   );
// // }
// //
// class Contextprovider extends StatelessWidget {
//   Widget w;
//   Contextprovider(this.w);
//   @override
//   Widget build(BuildContext context) {
//     return w;
//   }
// }
