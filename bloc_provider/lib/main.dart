import 'package:bloc_provider/conf/store/appstore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginWidget(),
    );
  }
}