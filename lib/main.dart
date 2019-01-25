import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(


      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: new Stack(fit: StackFit.expand, children: <Widget>[
        new Image(
          image: new AssetImage("assets/background.jpg"),
          fit: BoxFit.cover,

//          color: Colors.amber,
        ),
        new Theme(
          data: new ThemeData(
            accentColor: Colors.amber,
              brightness: Brightness.light,
              inputDecorationTheme: new InputDecorationTheme(
                // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle: new TextStyle(color: Colors.white, fontSize: 25.0),
              )),
          isMaterialAppTheme: true,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                colors: Colors.amber,
                size: _iconAnimation.value * 140.0,
              ),
              new Container(
                padding: const EdgeInsets.all(40.0),
                child: new Form(
                  autovalidate: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(


                            icon: const Icon(
                              Icons.email,
                              color: Colors.amber,
                            ),
                            labelText: "Email",
                            fillColor: Colors.white),
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
//                        autocorrect: true,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      new TextFormField(

                        decoration: new InputDecoration(
                          icon: const Icon(
                            Icons.lock,
                            color: Colors.amber,
                          ),
                          labelText: "Password",
                        ),
                        obscureText: true,

                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                        keyboardType: TextInputType.text,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                      buildMaterialButton()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  ButtonTheme buildMaterialButton() {
    return ButtonTheme(
      minWidth: 200.0,
      height: 50.0,

      child: RaisedButton(
        child: new Text("Login", style: new TextStyle(fontSize: 20.0)),
        color: Colors.amber,
        splashColor: Colors.blue,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        onPressed: () {},
      ),
    );
  }
}
