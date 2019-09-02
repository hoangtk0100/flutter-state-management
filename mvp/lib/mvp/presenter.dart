import 'package:mvp/mvp/view.dart';

class Presenter<T extends View> {
  T view;

  attachView(T view) {
    this.view = view;
  }

  deAttachView() {
    this.view = null;
  }

  T getView() {
    return view;
  }
}