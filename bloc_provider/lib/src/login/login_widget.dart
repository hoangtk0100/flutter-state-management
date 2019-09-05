import 'package:bloc_provider/conf/store/appstore.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        builder: (_) => LoginBloc(),
        child: LoginBody()),
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();

    emailController.addListener(() {
      LoginBloc.of(context).emailSink.add(emailController.text);
    });

    passwordController.addListener(() {
      LoginBloc.of(context).passwordSink.add(passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    var loginBloc = LoginBloc.of(context);
    return Container(
        padding: EdgeInsets.only(right: 30.0, left: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<String>(
                stream: loginBloc.emailStream,
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
                stream: loginBloc.passwordStream,
                builder: (context, snapshot) {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
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
                stream: loginBloc.btnLoginStream,
                builder: (context, snapshot) {
                  return RaisedButton(
                    onPressed: snapshot.data == true ? () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) => HomeWidget()
                      ));
                    } : null,
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
