import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:week2_project/project/welcome_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Color(0xff584e9c),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
              child: Image.asset(
                'images/man.png',
                height: MediaQuery.of(context).size.height * 0.70,
              ),
            ),
            Align(
              alignment: Alignment(-0.8, -1),
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hallo,\nSelamat Datang!\n',
                        style: GoogleFonts.acme(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      TextSpan(
                        text: 'Silahkan Login',
                        style: GoogleFonts.acme(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(1.1, 0.85),
              child: Container(
                width: 200,
                child: FloatingActionButton(
                    onPressed: () => this
                        ._key
                        .currentState
                        .showBottomSheet((context) => _bottomSheet(context)),
                    backgroundColor: Colors.purpleAccent,
                    child: Icon(Icons.vpn_key)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _bottomSheet(BuildContext context) {
    TextEditingController _username = TextEditingController();
    TextEditingController _password = TextEditingController();

    String username = 'admin';
    String password = 'admin';

    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      padding: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _username,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.alternate_email,
                  color: Colors.black,
                ),
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.vpn_key,
                  color: Colors.black,
                ),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 16),
            MaterialButton(
              minWidth: 150,
              color: Colors.purpleAccent,
              textColor: Colors.white,
              shape: StadiumBorder(),
              onPressed: () {
                setState(() {
                  if (_username.text.isEmpty || _password.text.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Tolong isi field Username/Password!',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16,
                    );
                  } else if (_username.text.trim() == username &&
                      _password.text.trim() == password) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomePage(_username.text, _password.text)));
                  } else {
                    Fluttertoast.showToast(
                      msg: 'Username / Password Salah',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16,
                    );
                  }
                });
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
