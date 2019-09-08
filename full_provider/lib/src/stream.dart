import 'package:full_provider/conf/store/appstore.dart';

class StreamProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Stream Provider'),
      body: StreamProvider<String>.value(
        initialData: 'noname',
        value: getName(),
        child: StreamWidget(),
      ),
    );
  }

  Stream<String> getName() {
    return Stream.fromFuture(Future.delayed(Duration(seconds: 1), () {
      return 'Kirito';
    }));
  }
}

class StreamWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<String>(
      builder: (context, value, child) {
        return Center(
          child: Text(
            value,
            style: TextStyle(fontSize: 60.0),
          ),
        );
      },
    );
  }
}