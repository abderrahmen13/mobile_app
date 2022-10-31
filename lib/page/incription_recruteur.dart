import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

import 'package:date_range_form_field/date_range_form_field.dart';
//import 'package:date/date.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/api/api_key.dart';
import 'package:mobile_app/page/modalite_pai.dart';

import 'delayed_animation.dart';
import 'package:http/http.dart' as http;

class Inscription_recuteur extends StatefulWidget {
  const Inscription_recuteur({super.key});

  @override
  _Inscription_recuteurState createState() => _Inscription_recuteurState();
}

class _Inscription_recuteurState extends State<Inscription_recuteur> {
  var _obscureText = true;
  String laravelServerApi = ApiKey.laravelServerApi;
  late TextEditingController controllerName;
  late TextEditingController controllerAdress;
  late TextEditingController controllerLastname;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPassword;
  late TextEditingController controllerCity;
  late TextEditingController controllerCompany;

  @override
  void initState() {
    super.initState();
    controllerName = TextEditingController();
    controllerAdress = TextEditingController();
    controllerLastname = TextEditingController();
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
    controllerCity = TextEditingController();
    controllerCompany = TextEditingController();
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerAdress.dispose();
    controllerLastname.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerCity.dispose();
    controllerCompany.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedAnimation(
                    delay: 1500,
                    child: Text(
                      "create you account !",
                      /* style: GoogleFonts.poppins(
                        color: d_red,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),*/
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Column(children: [
                DelayedAnimation(
                  delay: 3500,
                  child: TextField(
                    controller: controllerName,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                DelayedAnimation(
                  delay: 3500,
                  child: TextField(
                    controller: controllerLastname,
                    decoration: InputDecoration(
                      labelText: 'LastName',
                      labelStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                DelayedAnimation(
                  delay: 3500,
                  child: TextField(
                    controller: controllerEmail,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                DelayedAnimation(
                  delay: 4500,
                  child: TextField(
                    controller: controllerPassword,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      labelText: 'mot de passe',
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.visibility,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                DelayedAnimation(
                  delay: 3500,
                  child: TextField(
                    controller: controllerAdress,
                    decoration: InputDecoration(
                      labelText: 'Adresse',
                      labelStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                DelayedAnimation(
                  delay: 3500,
                  child: TextField(
                    controller: controllerCity,
                    decoration: InputDecoration(
                      labelText: 'Ville',
                      labelStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
                DelayedAnimation(
                  delay: 3500,
                  child: TextField(
                    controller: controllerCompany,
                    decoration: InputDecoration(
                      labelText: 'Entreprise',
                      labelStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(height: 125),
            DelayedAnimation(
              delay: 5500,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromARGB(255, 243, 13, 193),
                  padding: EdgeInsets.symmetric(
                    horizontal: 125,
                    vertical: 13,
                  ),
                ),
                child: Text(
                  'valider',
                  /* style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),*/
                ),
                onPressed: () async {
                  var res = await http
                      .post(Uri.parse('$laravelServerApi/users/create'), body: {
                    "Role": "client",
                    "firstName": controllerName.value.text,
                    "lastName": controllerLastname.value.text,
                    "address": controllerAdress.value.text,
                    "city": controllerCity.value.text,
                    "email": controllerEmail.value.text,
                    "password": controllerPassword.value.text,
                    "company": controllerCompany.value.text,
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => modalite_pai(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 90),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 35),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: DelayedAnimation(
                    delay: 6500,
                    child: Text(
                      "SKIP",
                      /*style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),*/
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
