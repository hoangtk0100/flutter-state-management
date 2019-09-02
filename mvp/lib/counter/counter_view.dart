import 'package:mvp/mvp/view.dart';

abstract class CounterView extends View {
  void onIncrement(int value);
  void onDecrement(int value);
}