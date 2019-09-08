import 'package:full_provider/conf/store/appstore.dart';

class Counter extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  set counter(int val) {
    _counter = val;
    notifyListeners();
  }

  void increment() {
    ++counter;
  }

  void decrement() {
    --counter;
  }
}

class ChangeNotifierProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<Counter>.value(
    //     value: Counter(),
    //     child: MaterialApp(
    //       home: ChangeNotifierWidget()));

    // return MultiProvider(providers: [
    //   ChangeNotifierProvider<Counter>.value(
    //     value: Counter(),
    //   )
    // ], child: MaterialApp(home: ChangeNotifierWidget()));

    return Scaffold(
      appBar: customAppBar('ChangeNotifier Provider'),
      body: ChangeNotifierProvider<Counter>(
        builder: (context) => Counter(),
        child: ChangeNotifierWidget(),
      ),
    );
  }
}

class ChangeNotifierWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Counter counterBloc = Provider.of<Counter>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            counterBloc.counter.toString(),
            style: TextStyle(fontSize: 62.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Icon(Icons.remove),
                onPressed: () => counterBloc.decrement(),
              ),
              SizedBox(
                width: 10.0,
              ),
              RaisedButton(
                child: Icon(Icons.add),
                onPressed: () => counterBloc.increment(),
              )
            ],
          )
        ],
      ),
    );
  }
}
