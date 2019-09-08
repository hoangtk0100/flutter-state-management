import 'package:full_provider/conf/store/appstore.dart';

/// Mulitple provider with ChangeNotifier
class Counter1 with ChangeNotifier {
  int _counter = 10;
  int get counter => _counter;

  increment() {
    _counter++;
    notifyListeners();
  }
}

class Counter2 with ChangeNotifier {
  int _counter = 20;
  int get counter => _counter;

  increment() {
    _counter++;
    notifyListeners();
  }
}

class MultipleProviderWithChangeNotifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Provider'),
      ),
      body: MultiProvider(
          providers: [
            ChangeNotifierProvider(builder: (_) => Counter1()),
            ChangeNotifierProvider(builder: (_) => Counter2()),
          ],
          child: MultipleProviderWithChangeNotifierWidget()),
    );
  }
}

class MultipleProviderWithChangeNotifierWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter1 counter1 = Provider.of<Counter1>(context);
    Counter2 counter2 = Provider.of<Counter2>(context);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.blueAccent,
            child: FlatButton.icon(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                'Increment',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
              onPressed: () {
                counter1.increment();
                counter2.increment();
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'counter1: ' + counter1.counter.toString(),
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                '|',
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                'counter2: ' + counter2.counter.toString(),
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/// Mulitple provider without ChangeNotifier
/// StateObject does not inherit from ChangeNotifier
class Counter3 {
  int _counter = 30;
  int get counter => _counter;

  increment() {
    _counter++;
  }
}

class Counter4 {
  int _counter = 40;
  int get counter => _counter;

  increment() {
    _counter++;
  }
}

class MultipleProviderWithoutChangeNotifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiple Provider'),
      ),
      body: MultiProvider(
          providers: [
            Provider<Counter3>.value(value: Counter3(),),
            Provider<Counter4>.value(value: Counter4(),),
          ],
          child: MultipleProviderWithoutChangeNotifierWidget()),
    );
  }
}

class MultipleProviderWithoutChangeNotifierWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter3 counter3 = Provider.of<Counter3>(context);
    Counter4 counter4 = Provider.of<Counter4>(context);

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.blueAccent,
            child: FlatButton.icon(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                'Increment',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
              onPressed: () {
                counter3.increment();
                counter4.increment();
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'counter3: ' + counter3.counter.toString(),
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                '|',
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                'counter4: ' + counter4.counter.toString(),
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
