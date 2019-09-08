import 'package:full_provider/conf/store/appstore.dart';

class Counter {
  final ValueNotifier<int> valueNotifier = ValueNotifier(0);
}

class ValueListenableProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar('Value Listenable Provider'),
        body: Provider<Counter>(
          builder: (context) => Counter(),
          child: Consumer<Counter>(
            builder: (context, counter, child) {
              return ValueListenableProvider<int>.value(
                  value: counter.valueNotifier,
                  child: Center(
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _ConsumerWidget(),
                        _WithoutConsumerWidget()
                      ],
                    )),
                  ));
            },
          ),
        ));
  }
}

class _ConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<int>(builder: (context, value, child) {
      return Text(
          value.toString(),
          style: TextStyle(
            fontSize: 32.0,
          ));
    });
  }
}

class _WithoutConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return RaisedButton(
      child: Text(
        'Increment',
        style: TextStyle(
          fontSize: 32.0,
        ),
      ),
      onPressed: () {
        counter.valueNotifier.value++;
      },
    );
  }
}
