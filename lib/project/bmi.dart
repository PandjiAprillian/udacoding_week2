import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextStyle title = GoogleFonts.barlow(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400);
  final Color genderSelected = Color(0xffA2F0BC);
  final Color genderUnselected = Color(0xff202020);

  bool isPressedMale = false;
  bool isPressedFemale = false;
  bool male = false;
  bool female = false;
  int age = 0;

  void calculate() {
    setState(() {
      if (_height.text.isEmpty || _weight.text.isEmpty) {
        Fluttertoast.showToast(
          msg: 'Tinggi atau Berat Tidak Boleh kosong!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16,
        );
      } else {
        if (age <= 0) {
          Fluttertoast.showToast(
            msg: 'Umur tidak boleh 0',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16,
          );
        } else {
          var weight = int.parse(_weight.text);
          var height = int.parse(_height.text);
          var bmi = weight / pow(height / 100, 2);

          showModalBottomSheet(
              context: context,
              builder: (context) => _bottomSheet(context, bmi));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: Color(0xff353535),
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: GoogleFonts.barlow(fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Color(0xff353535),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              'What you are?',
              style: title,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTapDown: (value) {
                          setState(() {
                            isPressedMale = true;
                            male = true;
                            isPressedFemale = false;
                            female = false;
                          });
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: (isPressedMale && male)
                                ? genderSelected
                                : genderUnselected,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: SvgPicture.asset(
                              'images/male.svg',
                              color: (isPressedMale && male)
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Male',
                        style: (isPressedMale && male)
                            ? TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)
                            : TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      GestureDetector(
                        onTapDown: (value) {
                          setState(() {
                            isPressedFemale = true;
                            female = true;
                            isPressedMale = false;
                            male = false;
                          });
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: (isPressedFemale && female)
                                ? genderSelected
                                : genderUnselected,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: SvgPicture.asset(
                              'images/female.svg',
                              color: (isPressedFemale && female)
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Female',
                        style: (isPressedFemale && female)
                            ? TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)
                            : TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: Divider(color: Colors.white),
            ),
            Text(
              'What\'s your age?',
              style: title,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Text(
                    '$age',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                        child: IconButton(
                          splashRadius: 18,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                          icon: Icon(Icons.keyboard_arrow_up),
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        splashRadius: 18,
                        onPressed: () {
                          setState(() {
                            (age <= 0) ? age -= 0 : age--;
                          });
                        },
                        icon: Icon(Icons.keyboard_arrow_down),
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 30),
              child: Divider(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'What\'s your Height?',
                          style: title,
                        ),
                        SizedBox(height: 30),
                        TextField(
                          controller: _height,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixText: 'cm',
                            suffixStyle:
                                TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 100),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'What\'s your Weight?',
                          style: title,
                        ),
                        SizedBox(height: 30),
                        TextField(
                          controller: _weight,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixText: 'kg',
                            suffixStyle:
                                TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80),
            Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                onPressed: () {
                  calculate();
                },
                color: Color(0xff57ECCC),
                shape: StadiumBorder(),
                child: Text('Calculate Your BMI'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _bottomSheet(BuildContext context, double bmi) {
    Color descColor = Color(0xff57ECCC);
    String desc;
    String note =
        'Meski BMI dapat bermanfaat untuk menentukan kondisi berat badan, BMI tidak sempurna karena tidak mampu memberikan informasi kondisi tubuh secara menyeluruh. Oleh sebab itu, konsultasikan hal ini lebih lanjut dengan dokter.';

    if (bmi <= 17.0) {
      desc = 'Kurus, Kekurangan berat badan';
    } else if (bmi <= 18.4) {
      desc = 'Kurus, Kekurangan berat badan';
    } else if (bmi <= 25.0) {
      desc = 'Berat Badan Anda Normal, Keren!';
    } else if (bmi >= 27) {
      desc = 'Gemuk, Anda Kelebihan Berat Badan!';
    }

    TextStyle descNote({double size, Color color, FontStyle style}) =>
        GoogleFonts.manrope(color: color, fontSize: size, fontStyle: style);

    return Container(
      color: Color(0xff363636),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              'Your BMI Result',
              style: descNote(size: 30, color: descColor),
            ),
            Text(
              '${bmi.toStringAsFixed(2)}',
              style: descNote(size: 26, color: Colors.white),
            ),
            Text(
              '$desc',
              style: descNote(size: 20, color: descColor),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                '"$note"',
                style: descNote(size: 16, color: descColor, style: FontStyle.italic),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
