part of '../HDM.dart';

class _StatsInitial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.blue,
        ),
      ),
    );
  }
}

class _StatsErrBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Err in StatsApp");
    return Scaffold(
      body: Center(
        child: Text("Err"),
      ),
    );
  }
}

class _StatsNoConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("No Connection"),
      ),
    );
  }
}
