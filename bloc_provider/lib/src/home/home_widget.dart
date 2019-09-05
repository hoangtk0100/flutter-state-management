import 'package:bloc_provider/conf/store/appstore.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          'Home',
          style: TextStyle(fontSize: 48.0),
        ),
      ),
    );
  }
}
