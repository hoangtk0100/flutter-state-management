import 'package:full_provider/conf/store/appstore.dart';

// class CounterApi {
//   int _counter = 110;
//   int get counter => _counter;

//   increment() {
//     _counter++;
//   }
// }

class CounterApi with ChangeNotifier {
  int _counter = 110;
  int get counter => _counter;

  increment() {
    _counter++;
    notifyListeners();
  }
}

class CounterService {
  CounterApi _api;
  CounterService({@required CounterApi api}) : _api = api;
  CounterApi get api => _api;
}

class CounterModel extends ChangeNotifier {
  CounterService _service;
  CounterModel({@required CounterService service}) : _service = service;
  CounterService get service => _service;
}

class ProxyProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proxy Provider'),
      ),
      body: MultiProvider(
        providers: [
          // Provider<CounterApi>.value(
          //   value: CounterApi(),
          // ),
          ChangeNotifierProvider<CounterApi>.value(
            value: CounterApi(),
          ),
          ProxyProvider<CounterApi, CounterService>(
            builder: (context, counterApi, service) =>
                CounterService(api: counterApi),
          )
        ],
        child: ProxyWidget(),
      ),
    );
  }
}

class ProxyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>.value(
      // value: CounterModel(service: Provider.of<CounterService>(context)),
      value: CounterModel(service: Provider.of(context)),
      child: Consumer<CounterModel>(
        builder: (context, model, child) {
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                model.service.api.counter.toString(),
                style: TextStyle(fontSize: 60.0),
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                child: Icon(Icons.add),
                onPressed: () {
                  model.service.api.increment();
                },
              )
            ],
          ));
        },
      ),
    );
  }
}
