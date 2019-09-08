import 'package:full_provider/conf/store/appstore.dart';

class User {
  String _fullName;
  String get fullName => _fullName;
  set fullName(newFullName) => _fullName = newFullName;
}

class BasicProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = User();
    user.fullName = 'Kirito';

    return Provider<User>.value(
      value: user,
      child: BasicWidget(),
    );
  }
}

class BasicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Provider'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _ConsumerWidget(),
            SizedBox(
              height: 20.0,
            ),
            _WithoutConsumerWidget(),
          ],
        ),
      ),
    );
  }
}

class _ConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context, user, child) => Text(user.fullName),
    );
  }
}

class _WithoutConsumerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return Container(
      child: Text(user.fullName),
    );
  }
}
