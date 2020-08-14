import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:week2_project/main.dart';

class WelcomePage extends StatelessWidget {
  final String username;
  final String password;

  WelcomePage(this.username, this.password);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Color(0xffEFE3CD),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 200),
              child: Image.asset(
                'images/welcome.gif',
                width: size.width,
              ),
            ),
            Text(
              'Selamat Datang $username!, Password : $password',
              style: GoogleFonts.baloo(fontSize: 20, color: Colors.black54),
            ),
            SizedBox(height: 20),
            RaisedButton(
              onPressed: () {
                showDialog(context: context, builder: (_) {
                  return NetworkGiffyDialog(image: Image.asset('images/logout.gif', fit: BoxFit.cover,),
                    title: Text('Yakin Ingin Logout?', style: TextStyle(fontSize: 20),),
                    buttonOkColor: Colors.red,
                    buttonCancelColor: Colors.amber,
                    onOkButtonPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  );
                });
              },
              shape: StadiumBorder(),
              color: Colors.redAccent,
              child: Text(
                'LogOut',
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
