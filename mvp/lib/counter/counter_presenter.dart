import 'package:mvp/counter/counter_view.dart';
import 'package:mvp/mvp/presenter.dart';

class CounterPresenter extends Presenter<CounterView> {
  int counter = 0;

  increment() {
    ++counter;
    getView().onIncrement(counter);
  }

  decrement() {
    --counter;
    getView().onDecrement(counter);
  }
}