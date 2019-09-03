import 'package:mvvm/conf/store/appstore.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetBody(),
    );
  }
}

class WidgetBody extends StatefulWidget {
  @override
  _WidgetBodyState createState() => _WidgetBodyState();
}

class _WidgetBodyState extends State<WidgetBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final loginViewModel = ViewModel();

  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      loginViewModel.emailSink.add(emailController.text);
    });

    passwordController.addListener(() {
      loginViewModel.passwordSink.add(passwordController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();

    loginViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 30.0, left: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<String>(
                stream: loginViewModel.emailStream,
                builder: (context, snapshot) {
                  return TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      hintText: 'example@gmail.com',
                      labelText: 'Email *',
                      errorText: snapshot.data,
                    ),
                  );
                }),
            SizedBox(
              height: 20.0,
            ),
            StreamBuilder<String>(
                stream: loginViewModel.passwordStream,
                builder: (context, snapshot) {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      hintText: 'example@gmail.com',
                      labelText: 'Password *',
                      errorText: snapshot.data,
                    ),
                  );
                }),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 50.0,
              width: 200.0,
              child: StreamBuilder<bool>(
                stream: loginViewModel.btnLoginStream,
                builder: (context, snapshot) {
                  return RaisedButton(
                    onPressed: snapshot.data == true ? () {} : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.blue,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        ));
  }
}
