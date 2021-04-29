import 'dart:ui';

import 'package:comunicate_colegios_app/models/person_models.dart';
import 'package:comunicate_colegios_app/pages/profile/profile_pages.dart';
import 'package:comunicate_colegios_app/services/Auth/login_provider.dart';
import 'package:flutter/material.dart';

class SignInPages extends StatefulWidget {
  SignInPages({Key key}) : super(key: key);
  static final String routeName = "signIn";

  @override
  _SignInPagesState createState() => _SignInPagesState();
}

class _SignInPagesState extends State<SignInPages> {
  final formkey = GlobalKey<FormState>();
  bool isLoading = false;
  bool error = false;

  LoginProvider authMethod = new LoginProvider();

  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  void showAlertDialog(BuildContext context, String header, String msn) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(header),
      content: Text(msn),
      actions: [
        TextButton(
            child: Text('Aceptar'),
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  sigmMe(BuildContext context) async {
    if (formkey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      Usuario _user = await authMethod.validationUser(
          emailcontroller.text, passwordcontroller.text);

      if (_user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProfilePages()));
      } else {
        showAlertDialog(context, "Inicio de sesion", "Usuario no encontrado");
        setState(() {
          isLoading = false;
          error = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: isLoading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : SafeArea(
                child: Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height - 10,
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Flexible(
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset('images/kids.jpg')),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),

                        Form(
                          key: formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (val) {
                                    if (val.isEmpty)
                                      return "Ingrese una contraseña";
                                    // if (!RegExp(
                                    //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    //     .hasMatch(val))
                                    //   return "Ingrese un correo valido";

                                    return null;
                                  },
                                  controller: emailcontroller,
                                  style: TextStyle(fontSize: 17.0),
                                  decoration: InputDecoration(
                                      hintText: 'Correo',
                                      icon: Icon(Icons.email),
                                      labelText: 'Correo')),
                              TextFormField(
                                validator: (val) {
                                  if (val.isEmpty)
                                    return "Ingrese una contraseña";

                                  return null;
                                },
                                controller: passwordcontroller,
                                obscureText: true,
                                style: TextStyle(fontSize: 17.0),
                                decoration: InputDecoration(
                                    hintText: 'Contraseña',
                                    icon: Icon(Icons.lock),
                                    labelText: "Contraseña"),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Text('Recuperar contraseña'),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            sigmMe(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                const Color(0xff007EF4),
                                const Color(0xff2A75BC)
                              ]),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text(
                              'Ingresar',
                              style: TextStyle(
                                  fontSize: 17.0, color: Colors.white),
                            ),
                          ),
                        ),
                        error
                            ? Container(
                                padding: EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  'Usuario no encontrado',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20.0),
                                ),
                              )
                            : SizedBox(
                                height: 10,
                              )
                        // SizedBox(
                        //   height: 50.0,
                        // ),
                      ],
                    )),
              ),
      ),
    );
  }
}
