import 'package:flutter/material.dart';
import 'package:mvp/counter/counter_presenter.dart';
import 'package:mvp/counter/counter_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> implements CounterView {
  int counter = 0;

  CounterPresenter presenter;

  _CounterWidgetState() {
    presenter = new CounterPresenter();
    presenter.attachView(this);
  }

  @override
  void dispose() {
    super.dispose();
    if (presenter != null) {
      presenter.deAttachView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVP DEMO'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                '-',
                style: TextStyle(
                  fontSize: 32.0,
                ),
              ),
              onPressed: () {
                presenter.decrement();
              },
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              '$counter',
              style: TextStyle(
                fontSize: 32.0,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            RaisedButton(
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 32.0,
                ),
              ),
              onPressed: () {
                presenter.increment();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onDecrement(int value) {
    setState(() {
      counter = value;
    });
  }

  @override
  void onIncrement(int value) {
    setState(() {
      counter = value;
    });
  }
}
