import 'package:full_provider/conf/store/appstore.dart';

void main() {
  runApp(Demo());
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamProviders(),
    );
  }
}