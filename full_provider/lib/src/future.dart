import 'package:full_provider/conf/store/appstore.dart';

class FutureProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Future Provider'),
      body: FutureProvider<String>.value(
        initialData: 'noname',
        value: getName(),
        child: FutureWidget(),
      ),
    );
  }

  Future<String> getName() {
    return Future.delayed(Duration(seconds: 1), () {
      return 'Kirito';
    });
  }
}

class FutureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<String>(builder: (context, value, child) {
      return Center(
          child: Text(
        value,
        style: TextStyle(fontSize: 60.0),
      ));
    });
  }
}
